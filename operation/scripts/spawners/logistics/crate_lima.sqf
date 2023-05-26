// Lima - 81mm HE
private _map = worldName;
private _posA = [];
// Container name, ie the box name the stuffs going in.
private _vhcName = "plp_ct_MilBoxSmallOlive";
// Only set this if you are using single ammo type, else do it the long way.
private _ammoName = "UK3CB_BAF_1Rnd_81mm_Mo_Shells";

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
	_spawnVhc = createVehicle [_vhcName, _posA,[],0,"NONE"];
	_spawnVhc setDir 0;
	_spawnVhc enableDynamicSimulation true;

	// Quick cleanup.
	clearItemCargoGlobal _spawnVhc;
	clearMagazineCargoGlobal _spawnVhc;
	clearWeaponCargoGlobal _spawnVhc;

	// Fill with required items.
	_spawnVhc addMagazineAmmoCargo  [_ammoName, 20, 20]; 

};
