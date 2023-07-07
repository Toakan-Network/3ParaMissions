private _map = worldName;
private _posA = [];
private _posB = [];
private _dir = 165;

switch (_map) do
{
	case "rof_mok": {
		_posA = [9828.36,19631.3,0];
		_posB = [9818.03,19628.3,0];
	};

	case "Napf":{
		_posA = [14344.892,16934.951,0];
		_posB = [14350.057,16928.713,0];
		_dir = 229;
	};

	case "NapfWinter":{
		_posA = [14344.892,16934.951,0];
		_posB = [14350.057,16928.713,0];
		_dir = 229;
	};

	default {false};
};

if (!isnil "_map") then {

	_spawnVhc = createVehicle ["rksla3_foxhound_lppv_tes", _posA,[],0,"NONE"];
	_spawnVhc setDir _dir;
	_spawnVhc enableDynamicSimulation true;
	[_spawnVhc,["Woodland",1], true	] call BIS_fnc_initVehicle;
	[_spawnVhc] call tcz_fnc_objectCreation;
	
	_spawnVhc = createVehicle ["rksla3_foxhound_lppv_tes", _posB,[],0,"NONE"];
	_spawnVhc setDir _dir;
	_spawnVhc enableDynamicSimulation true;
	[_spawnVhc,["Woodland",1], true	] call BIS_fnc_initVehicle;
	[_spawnVhc] call tcz_fnc_objectCreation;
};

