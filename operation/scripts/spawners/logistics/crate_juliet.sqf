// Juliet - Medical Basic
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
	_spawnVhc = createVehicle ["ACE_medicalSupplyCrate_advanced", _posA,[],0,"NONE"];
	_spawnVhc setDir 0;
	_spawnVhc enableDynamicSimulation true;

	// Quick cleanup.
	clearItemCargoGlobal _spawnVhc;
	clearMagazineCargoGlobal _spawnVhc;
	clearWeaponCargoGlobal _spawnVhc;

	// Fill with required items.
	_spawnVhc addItemCargoGlobal ["ACE_fieldDressing", 30];
	_spawnVhc addItemCargoGlobal ["ACE_elasticBandage", 30];
	_spawnVhc addItemCargoGlobal ["ACE_packingBandage", 30];
	_spawnVhc addItemCargoGlobal ["ACE_quikclot", 20];
	_spawnVhc addItemCargoGlobal ["ACE_epinephrine", 15];
	_spawnVhc addItemCargoGlobal ["ACE_morphine", 15];
	_spawnVhc addItemCargoGlobal ["kat_chestSeal", 20];
	_spawnVhc addItemCargoGlobal ["kat_ncdKit", 10];
	_spawnVhc addItemCargoGlobal ["ACE_splint", 20];
	_spawnVhc addItemCargoGlobal ["kat_IO_FAST", 10];
	_spawnVhc addItemCargoGlobal ["kat_guedel", 20];

};
