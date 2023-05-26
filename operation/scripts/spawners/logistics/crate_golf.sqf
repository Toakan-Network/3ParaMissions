// Grenadier
private _map = worldName;
private _posA = [];

switch (_map) do
{
	case "rof_mok": {
		_posA = [[9882.280,19580.297,0], 0, 5, 5] call BIS_fnc_findSafePos;;
	};

	case "Napf":{
		_posA = [[15088.358,16471.05,0], 0, 7, 5] call BIS_fnc_findSafePos;
	};

	default {false};
};

if (!isnil "_map") then {

	// Setup box
	_spawnVhc = createVehicle ["plp_ct_MilBoxSmallOlive", _posA,[],0,"NONE"];
	_spawnVhc setDir 0;
	_spawnVhc enableDynamicSimulation true;

	// Quick cleanup.
	clearItemCargoGlobal _spawnVhc;
	clearMagazineCargoGlobal _spawnVhc;
	clearWeaponCargoGlobal _spawnVhc;

	// Fill with required items.
	_spawnVhc addItemCargoGlobal ["rhs_mag_m67", 15];
	_spawnVhc addItemCargoGlobal ["SmokeShell", 15];
	_spawnVhc addItemCargoGlobal ["SmokeShellPurple", 10];
	_spawnVhc addItemCargoGlobal ["SmokeShellBlue", 10];
	_spawnVhc addItemCargoGlobal ["rhs_mag_m18_red", 5];

};
