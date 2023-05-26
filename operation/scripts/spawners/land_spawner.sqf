private _map = worldName;
_spawner = _this select 0;

_spawner addaction ["Spawn Foxhound", {execVM 'scripts\spawners\infantry\deployFoxhound.sqf'}];
_spawner addaction ["Spawn WMIK", {execVM 'scripts\spawners\infantry\deployWMIK.sqf'}];

switch (_map) do
{
	case "rof_mok": {
		_spawner addaction ["Spawn Offroad", {execVM 'scripts\spawners\infantry\deployQuad.sqf'}];
		_spawner addaction ["Spawn Ambulance", {execVM 'scripts\spawners\infantry\deployAmbo.sqf'}];
		_spawner addaction ["Spawn Land Rover", {execVM 'scripts\spawners\infantry\deployLand.sqf'}];
	};

	case "Napf":{
		_spawner addaction ["Spawn Challenger 2", {execVM 'scripts\spawners\infantry\deployC2.sqf'}];
	};
	
	default {false};
};




