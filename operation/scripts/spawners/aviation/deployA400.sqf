private _map = worldName;
private _posA = [];
private _dir = 0;

switch (_map) do
{
	case "rof_mok": {
		_posA = [9803,18986.658,0];
		_dir = 108;
	};

	case "Napf":{
		_posA = [15171.545,16215.987,0];
		_dir = 318;
	};

	case "NapfWinter":{
		_posA = [15171.545,16215.987,0];
		_dir = 318;
	};

	default {false};
};

if (!isnil "_map") then {

	_vhcloc = [_posA, 10, 1, 5, 0, 0, 0] call bis_fnc_findsafepos;
	_spawnVhc = createVehicle ["B_A400M_UK_CAMO_F", _vhcloc, [], 0, "NONE"];
	_spawnVhc setDir _dir;
	_spawnVhc enableDynamicSimulation true;

};

