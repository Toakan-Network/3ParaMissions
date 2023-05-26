private _map = worldName;
private _posA = [];
private _posB = [];


switch (_map) do
{
	case "rof_mok": {
		_posA = [15471,9870,0];
	};

	case "Napf":{
		_posA = [14280.366,16968.947,0];
		_dir = 100;
	};

	default {false};
};

if (!isnil "_map") then {

	_spawnVhc = createVehicle ["ACE_Box_Ammo", _posA,[],0,"NONE"];  
	_spawnVhc setDir 0;  
	_spawnVhc enableDynamicSimulation true;  
	clearItemCargoGlobal _spawnVhc; 
	ClearWeaponCargoGlobal _spawnVhc; 
	ClearMagazineCargoGlobal _spawnVhc; 
	_spawnVhc addMagazineAmmoCargo  ["UK3CB_BAF_1Rnd_81mm_Mo_Shells", 20, 20]; 

};
