params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];

if (hasInterface AND (isClass (configFile >> "CfgPatches" >> "acre_main"))) then {
	0 = call compile preprocessFileLineNumbers "scripts\init\acre_channels.sqf";
};