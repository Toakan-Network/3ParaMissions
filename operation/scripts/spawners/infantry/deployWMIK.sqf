private _map = worldName;
private _posA = [];
private _dir = 0;

switch (_map) do
{
	case "rof_mok": {
		_posA = [9838.33,19633.6,0];
		_dir = 165;
	};

	case "Napf":{
		_posA = [14355.052,16922.582,0];
		_dir = 229;
	};

	case "NapfWinter":{
		_posA = [14355.052,16922.582,0];
		_dir = 229;
	};

	default {false};
};

if (!isnil "_map") then {

	_spawnVhc = createVehicle ["UK3CB_BAF_LandRover_WMIK_HMG_Green_A", _posA,[],0,"NONE"];
	_spawnVhc setDir _dir;
	_spawnVhc enableDynamicSimulation true;
	[_spawnVhc,["Green",1], ["ClanLogo_Hide",1,"AerialAtuL_Hide",1,"AerialAtuR_Hide",1,"AerialFL_Hide",1,"AerialFR_Hide",1,"AirIntakeSnorkel_Hide",0,"Flag_Hide",0,"Mudguards_Hide",1,"Radio_Hide",1,"SideLockers_Hide",0]	] call BIS_fnc_initVehicle;
	[_spawnVhc] call tcz_fnc_vehiclecamonets;
	[_spawnVhc] call tcz_fnc_objectCreation;
};

