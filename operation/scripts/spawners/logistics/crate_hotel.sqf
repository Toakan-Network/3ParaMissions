// 40mm Grenades
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
	_spawnVhc addItemCargoGlobal ["UK3CB_BAF_1Rnd_HE_Grenade_Shell", 30];
	_spawnVhc addItemCargoGlobal ["UK3CB_BAF_1Rnd_SmokeRed_Grenade_shell", 10];
	_spawnVhc addItemCargoGlobal ["UK3CB_BAF_1Rnd_Smoke_Grenade_shell", 10];
	_spawnVhc addItemCargoGlobal ["UK3CB_BAF_1Rnd_SmokeBlue_Grenade_shell", 10];

};
