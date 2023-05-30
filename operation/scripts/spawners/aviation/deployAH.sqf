private _map = worldName;
private _posA = [];
private _dir = 0;

switch (_map) do
{
	case "rof_mok": {
		_posA = [9806.29,18948.9,0];
	};

	case "Napf":{
		_posA = [15056.148,16481.270,0];
		_dir = 50;
	};

	case "NapfWinter ":{
		_posA = [15056.148,16481.270,0];
		_dir = 50;
	};

	default {false};
};

if (!isnil "_map") then {
	_vhcloc = [_posA, 0, 1, 5, 0, 0, 0] call bis_fnc_findsafepos;
	_spawnVhc = createVehicle ["fza_ah64d_b2e", _vhcloc, [], 0, "NONE"];
	_spawnVhc setDir _dir;
	_spawnVhc enableDynamicSimulation true;
	[
		_spawnVhc,
		["UK_AAC",1], 
		["fcr_enable",1,"magazine_set_1200",0,"pdoor",0,"gdoor",0]
	] call BIS_fnc_initVehicle;

};

