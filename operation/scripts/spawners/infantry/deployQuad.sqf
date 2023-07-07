private _map = worldName;
private _posA = [];

switch (_map) do
{
	case "rof_mok": {
		_posA = [9867,19641,0];
	};

	default {false};
};

if (!isnil "_map") then {

	_spawnVhc = createVehicle ["lb_quadwd", _posA,[],0,"NONE"];
	_spawnVhc setDir 165;
	_spawnVhc enableDynamicSimulation true;
	[_spawnVhc,["Blu_Woodland",1], true	] call BIS_fnc_initVehicle;
	[_spawnVhc] call tcz_fnc_vehiclecamonets;
};

