private _map = worldName;
private _posA = [];
private _dir = 0;

switch (_map) do
{
	case "rof_mok": {
		_posA = [9741.945,18920.6,3];
	};

	case "Napf":{
		_posA = [15096.085,16437.035,1];
		_dir = 50;
	};

	case "NapfWinter":{
		_posA = [15096.085,16437.035,1];
		_dir = 50;
	};

	default {false};
};

if (!isnil "_map") then {

	_vhcloc = [_posA, 1, 1, 5, 0, 0, 0] call bis_fnc_findsafepos;
	_spawnVhc = createVehicle ["TF373_RAF_HC5", _vhcloc, [], 0, "NONE"];
	_spawnVhc setDir _dir;
	_spawnVhc enableDynamicSimulation true;
	[_spawnVhc] call tcz_fnc_objectCreation;

	[
		_spawnVhc,
		["TF373_RAF_HC5_Clean_No_Callsign",1], 
		["HideFrontLeftSki",1,"HideFrontRightSki",1,"HideBackLeftSki",1,"HideBackRightSki",1,"HideFlag",1,"HideRampGun",0,"HideM134Belt_2",1,"HideM134Belt_1",1,"HideSidePod",1,"HideM134_L",0,"HideM134_R",0,"HideProbe",1,"HideCargoSeats",0,"crew_door_right",0,"swing_arm_rotate",1,"crew_door_bar_rotate",0,"HideSlingHatchL",0,"HideSlingHatchR",0]
	] call BIS_fnc_initVehicle;
};

