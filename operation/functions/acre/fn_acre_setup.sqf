private _player = _this select 0;

if (!(isClass (configFile >> "CfgPatches" >> "acre_main"))) exitwith {
	[1, format["ACRE2 not detected, skipping setup"]] call tcz_fnc_log;
};

_channels = call tcz_fnc_acre_channels;

// Script list.
switch (true) do {

	// Server of any type
	case (isDedicated || (isnil "_player")): {
		[2, format ["Setting Acre for Server"]] call tcz_fnc_log;
	};

	// Player
	case (hasInterface): {
		[2, format ["Setting Acre for %1.", _player]] call tcz_fnc_log;
		[_player] call tcz_fnc_acre_babel;
		[_player] execvm "scripts\eh\acre_eh.sqf";
	};

	// Headless
	case (not hasInterface && not isDedicated): {
	};

	default {
	};

};
