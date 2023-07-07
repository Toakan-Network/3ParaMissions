private _map = worldName;
private _posA = [];
private _dir = 0;

switch (_map) do
{
	case "rof_mok": {
		_posA = [9741.945,18920.6,0];
	};

	case "Napf":{
		_posA = [15096.085,16437.035,0];
		_dir = 50;
	};

	case "NapfWinter":{
		_posA = [15096.085,16437.035,0];
		_dir = 50;
	};

	default {false};
};

if (!isnil "_map") then {

	_vhcloc = [_posA, 0, 1, 5, 0, 0, 0] call bis_fnc_findsafepos;
	_spawnVhc = createVehicle ["2MERCS_CH47_HC6", _vhcloc, [], 0, "NONE"];
	_spawnVhc setDir _dir;
	_spawnVhc enableDynamicSimulation true;
	[_spawnVhc] call tcz_fnc_objectCreation;
};

