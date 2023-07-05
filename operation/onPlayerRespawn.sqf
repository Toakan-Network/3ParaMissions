params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];

if (hasInterface AND (isClass (configFile >> "CfgPatches" >> "acre_main"))) then {
	0 = call tcz_fnc_acre_channels;
};

0 = call tcz_fnc_addAdminChannel;