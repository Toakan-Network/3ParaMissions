private _map = worldName;
private _posA = [];
private _dir = 0;

switch (_map) do
{
	case "rof_mok": {
		_posA = [9694.834,18895.682,0];
	};

	case "Napf":{
		_posA = [15070.092,16465.95,0];
		_dir = 50;
	};

	default {false};
};

if (!isnil "_map") then {

	_vhcloc = [_posA, 0, 1, 5, 0, 0, 0] call bis_fnc_findsafepos;
	_spawnVhc = createVehicle ["rksla3_puma_hc1_troop", _vhcloc, [], 0, "NONE"];
	_spawnVhc setDir _dir;
	_spawnVhc enableDynamicSimulation true;

};

