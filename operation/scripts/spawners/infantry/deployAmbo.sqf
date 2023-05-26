private _map = worldName;
private _posA = [];

switch (_map) do
{
	case "rof_mok": {
		_posA = [9847.96,19636.1,0];
	};

	default {false};
};

if (!isnil "_map") then {

	_spawnVhc = createVehicle ["UK3CB_BAF_LandRover_Amb_Green_A", _posA,[],0,"NONE"];
	_spawnVhc setDir 165;
	_spawnVhc enableDynamicSimulation true;
	[_spawnVhc,["Green",1], ["ClanLogo_Hide",1,"AerialAtuL_Hide",1,"AerialAtuR_Hide",1,"AerialFL_Hide",1,"AerialFR_Hide",1,"AirIntakeSnorkel_Hide",0,"Flag_Hide",0,"Mudguards_Hide",1,"Radio_Hide",1,"SideLockers_Hide",0]	] call BIS_fnc_initVehicle;

};

