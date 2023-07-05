if (!hasInterface) then {
    enableEnvironment false;
};
if (!isMultiplayer) exitWith {};
private _filename = 'initServer.sqf';

// Staff list
StaffList = call compile preprocessFileLineNumbers "scripts\misc\admins.sqf";
curators = createGroup sideLogic;

// Slot reservation & whitelisting
missionNamespace setVariable ["misionName", worldName];
missionNamespace setVariable ["zeus_whitelist_enabled",true];
missionNamespace setVariable ["whitelist_enabled",true];
missionNamespace setVariable ["perflogging", true];
missionNamespace setVariable ["zeus_updater", true];
missionNamespace setVariable ["LogLevel", 2];

// Mission Event Handlers.
[2, format ["Loading Mission Event Handlers."]] execvm "scripts\performance\log.sqf";
0 = call compile preprocessFileLineNumbers "scripts\eh\mission_eh.sqf";

[2, format ["Setting up Server performance loop."]] execvm "scripts\performance\log.sqf";
//Enable performance logging
[] spawn {
	private _perfScript = compileScript ["scripts\performance\logPerformance.sqf"];
	while {perflogging} do
		{
			call _perfScript;
			sleep 30;
		};
};

[2, format ["Setting up Server Zeus loops."]] execvm "scripts\performance\log.sqf";
// Enable Zeus checking
[] spawn {
	private _zeusWhiteScript = compileScript ["scripts\zeus\zeus_whitelist.sqf"];
	while {zeus_whitelist_enabled} do {
		[2,"Checking Zeus Whitelist."] execVM "scripts\performance\log.sqf";
		call _zeusWhiteScript;
		sleep 300; // Check Zeus every 5 minutes.
	};
};

// Update Zeus with all objects
[] spawn {
	while {zeus_updater} do {
		[2, format ["Updating Zeus Objects."]] execvm "scripts\performance\log.sqf";
		private _objects = (call tcz_fnc_getEditableObjects);

		{
			[_x, _objects] call tcz_fnc_updateEditableObjects;
		} forEach allCurators;
		sleep 120;
	}
};

// Discord loop
[] spawn {
		sleep 60;
		[
		// ["task",value]
		["UpdateDetails",	servername],
		["UpdateState",format ["Training in The Land Warfare Centre."]],
		["UpdateSmallImageKey","3para"],
		["UpdatePartySize",count playableUnits],
		["UpdatePartyMax",getNumber(missionConfigFile >> "Header" >> "maxPlayers")],
		["UpdateButtons",["Arma 3","https://3para.pro.unitcommander.co.uk/"]]
		] call (missionNameSpace getVariable ["DiscordRichPresence_fnc_update",{}]);
};

private _map = worldname;
private _trainingmap = "rof_mok";
if (_map isEqualTo _trainingmap) then {
	[2, format["Applying settings for %1", _map]] execvm "scripts\performance\log.sqf";
	
	// initialise common variable for rifle range script
	[] spawn RR_fnc_initCommon;

	// initialise each preplaced rifle range in the mission
	// [<RangeID>,<DrillTypes>,<NumberOfLanes>,<NumberOfDigits>,<DisplayName>,<Description>,<RangeImage>,<Marker>,<MarkerPos>,<MarkerType>,<MarkerColour>] spawn RR_fnc_initRifleRange
	["ETR2",["LMG","ETR"],8,3,"ACMT Range","An 8 lane electric target range (ETR) with targets placed at 100, 200, 300 and 400 meters. Three firing positions per lane are placed at 50, 100 and 200 meters distance from the first row of targets. Each set of targets consists of figure 11s standing three abreast that can be operated independently or as one. This range is suitable for a wide array of weapon systems and drills including light machineguns, medium machineguns, assault rifles and marksman rifles.",nil,true,getMarkerPos "ETR_Marker_0"] spawn RR_fnc_initRifleRange;
};

if (_map isNotEqualTo _trainingmap) then {
	// Operation Server
	// Setting up Save Data for ALIVE
	[] spawn {
		waitUntil {
			!isNil "ALiVE_SYS_DATA_SOURCE";
		};
		if (ALiVE_SYS_DATA_SOURCE isEqualTo "pns") then {
			[2, format ["Setting up ALIVE autosave."]] execvm "scripts\performance\log.sqf";
			900 call ALiVE_fnc_AutoSave_PNS;
		};
	};
};

[] execvm "scripts\init\acre_setup.sqf";
0 = call tcz_fnc_createAdminChannel;

[2, format ["initServer Completed for map:%1", worldName]] execvm "scripts\performance\log.sqf";