if (!hasInterface) then {
    enableEnvironment false;
};
if (!isMultiplayer) exitWith {};
private _filename = 'initServer.sqf';

// Staff list
StaffList = call compile preprocessFileLineNumbers "scripts\misc\admins.sqf";

// Slot reservation & whitelisting
missionNamespace setVariable ["misionName", worldName];
missionNamespace setVariable ["zeus_whitelist_enabled",true];
missionNamespace setVariable ["whitelist_enabled",true];
missionNamespace setVariable ["perflogging", true];
missionNamespace setVariable ["zeus_updater", true];

[2, format ["Setting up Server performance loop."]] execvm "scripts\performance\log.sqf";
//Enable performance logging
[] spawn {
	while {perflogging} do
		{
			["[3Para] Performance Log."] execVM "scripts\performance\logPerformance.sqf";
			sleep 30;
		};
};

[2, format ["Setting up Server Zeus loops."]] execvm "scripts\performance\log.sqf";
// Enable Zeus checking
[] spawn {
	while {zeus_whitelist_enabled} do {
		[2,"Checking Zeus Whitelist."] execVM "scripts\performance\log.sqf";
		[] execvm "scripts\zeus\zeus_whitelist.sqf";
		sleep 30;
	};
};
// Update Zeus with all objects
[] spawn {
	while {zeus_updater} do {
		[2, format ["Updating Zeus Objects."]] execvm "scripts\performance\log.sqf";
		private _objects = (call tad_fnc_getEditableObjects);

		{
			[_x, _objects] call tad_fnc_updateEditableObjects;
		} forEach allCurators;
		sleep 120;
	}
}

// Setup some Zeus things
execvm "scripts\zeus\player_ping.sqf";


[2, format ["initServer Completed for map:%1", worldName]] execvm "scripts\performance\log.sqf";