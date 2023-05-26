private _map = worldName;
private _posA = [];
private _dir = 0;

switch (_map) do
{
	case "rof_mok": {
		_posA = [9780.224,18949.578,0];
	};

	case "Napf":{
		_posA = [15070.698,16435.44,0];
		_dir = 138;
	};

	default {false};
};

if (!isnil "_map") then {

	_vhcloc = [_posA, 10, 1, 5, 0, 0, 0] call bis_fnc_findsafepos;
	_spawnVhc = createVehicle ["FIR_F35B_RAF02", _vhcloc, [], 0, "NONE"];
	_spawnVhc setDir _dir;
	_spawnVhc enableDynamicSimulation true;

};

