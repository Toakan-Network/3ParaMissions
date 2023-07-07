private _map = worldName;
private _posA = [];
private _posB = [];
private _dir = 0;

switch (_map) do
{
	case "Napf":{
		_posA = [14335.132,16941.348,0];
		_posB = [14330.214, 16947.563, 0];
		_dir = 201;
	};

	default {false};
};

if (!isnil "_map") then {

	_spawnVhc = createVehicle ["Burnes_FV4034_01", _posA,[],0,"NONE"];
	_spawnVhc setDir _dir;
	_spawnVhc enableDynamicSimulation true;
	[_spawnVhc,["Green",1], ["ClanLogo_Hide",1,"AerialAtuL_Hide",1,"AerialAtuR_Hide",1,"AerialFL_Hide",1,"AerialFR_Hide",1,"AirIntakeSnorkel_Hide",0,"Flag_Hide",0,"Mudguards_Hide",1,"Radio_Hide",1,"SideLockers_Hide",0]	] call BIS_fnc_initVehicle;

	_spawnVhc = createVehicle ["Burnes_FV4034_01", _posB,[],0,"NONE"];
	_spawnVhc setDir _dir;
	_spawnVhc enableDynamicSimulation true;
	[_spawnVhc,["Green",1], ["ClanLogo_Hide",1,"AerialAtuL_Hide",1,"AerialAtuR_Hide",1,"AerialFL_Hide",1,"AerialFR_Hide",1,"AirIntakeSnorkel_Hide",0,"Flag_Hide",0,"Mudguards_Hide",1,"Radio_Hide",1,"SideLockers_Hide",0]	] call BIS_fnc_initVehicle;
	[_spawnVhc] call tcz_fnc_objectCreation;
};

