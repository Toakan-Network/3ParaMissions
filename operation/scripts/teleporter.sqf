_caller = _this select 0;

// Context switching depending on the map we are using. Some actions are specifically for Operations or training.
private _tpImage = "";
private _map = worldName;
private _aviationSpawn = [];


switch (_map) do
{
	case "rof_mok": {
		_tpImage = "textures\mok_map.paa";
		// Training Areas
		_caller addaction ["Range", {player setpos ([[9933,18310,0], 2, 10, 5, 0, 0, 0] call bis_fnc_findsafepos)}]; 
		_caller addaction ["Mortar FOB", {player setpos ([[15475,9894,0], 2, 10, 5, 0, 0, 0] call bis_fnc_findsafepos)}]; 
		_caller addaction ["FIWAF FOB", {player setpos ([[17287,22967,0], 2, 10, 5, 0, 0, 0] call bis_fnc_findsafepos)}]; 
		_caller addaction ["Target Identification Range", {player setpos ([[11178,14538,0], 2, 10, 5, 0, 0, 0] call bis_fnc_findsafepos)}]; 
		_caller addaction ["Random Navigation Task", {player addaction ["Random Navigation", "scripts\nav\rtp.sqf"]}]; 
		_aviationSpawn = [9804,18892,0];
	};

	case "Napf":{
		_tpImage = "";
		_aviationSpawn = [];
	};
	
	default {false};
};

// General Actions
_caller SetObjectTexture [0,_tpImage];
_caller addaction ["Training Teleporter", ''];
_caller addaction ["----------", ''];

// Navigation TP
_caller addaction ["Aviation Spawn", {player setpos ([_aviationSpawn, 2, 10, 5, 0, 0, 0] call bis_fnc_findsafepos)}]; 