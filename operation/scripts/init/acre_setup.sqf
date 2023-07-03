private _player = _this select 0;

if (!(isClass (configFile >> "CfgPatches" >> "acre_main"))) exitwith {
	[1, format["ACRE2 not detected, skipping setup"]] execvm 'scripts\performance\log.sqf';
};

_channels = [] call compile preprocessFileLineNumbers "scripts\init\acre\acre_channels.sqf";

// Script list.
switch (true) do {

	// Server of any type
	case (isDedicated || (isnil "_player")): {
		[2, format ["Setting Acre for Server"]] execvm "scripts\performance\log.sqf";
		
	};

	// Player
	case (hasInterface): {
		[2, format ["Setting Acre for %1.", _player]] execvm "scripts\performance\log.sqf";
		[_player] 	execvm "scripts\init\acre\acre_babel.sqf";
		[_player] 	execvm "scripts\eh\acre_eh.sqf";
	};

	// Headless
	case (not hasInterface && not isDedicated): {
	};

	default {
	};

};
