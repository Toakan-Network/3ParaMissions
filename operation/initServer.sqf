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

[2, format ["initServer Completed for map:%1", worldName]] execvm "scripts\performance\log.sqf";