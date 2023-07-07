private _map = worldName;
private _posA = [];
private _dir = 0;

switch (_map) do
{
	case "rof_mok": {
		_posA = [9718.587,18908.480,0];
	};
	case "Napf":{
		_posA = [15083.167,16451.234,0];
		_dir = 50;
	};
	case "NapfWinter":{
		_posA = [15083.167,16451.234,0];
		_dir = 50;
	};
	default {false};
};

if (!isnil "_map") then {

	_vhcloc = [_posA, 0, 1, 5, 0, 0, 0] call bis_fnc_findsafepos;
	_spawnVhc = createVehicle ["UK3CB_BAF_Wildcat_AH1_TRN_8A", _vhcloc, [], 0, "NONE"];
	_spawnVhc setDir _dir;
	_spawnVhc enableDynamicSimulation true;
	[_spawnVhc] call tcz_fnc_objectCreation;
};

