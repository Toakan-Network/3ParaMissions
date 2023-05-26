// GPMG Ammo / 7.62 Belts
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
	_spawnVhc = createVehicle ["rhs_7ya37_1_single", _posA,[],0,"NONE"];
	_spawnVhc setDir 0;
	_spawnVhc enableDynamicSimulation true;

	// Quick cleanup.
	clearItemCargoGlobal _spawnVhc;
	clearMagazineCargoGlobal _spawnVhc;
	clearWeaponCargoGlobal _spawnVhc;

	// Fill with required items.
	_spawnVhc addItemCargoGlobal ["UK3CB_BAF_762_100Rnd", 20];
	_spawnVhc addItemCargoGlobal ["UK3CB_BAF_762_100Rnd_T", 20];
	_spawnVhc addItemCargoGlobal ["UK3CB_BAF_762_800Rnd", 5];
	_spawnVhc addItemCargoGlobal ["UK3CB_BAF_762_800Rnd_T", 5];

};
