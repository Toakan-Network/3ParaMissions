params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];

if (hasInterface AND (isClass (configFile >> "CfgPatches" >> "acre_main"))) then {
	[_newUnit] call tcz_fnc_acre_channels;
};

[_newUnit] call tcz_fnc_addAdminChannel;