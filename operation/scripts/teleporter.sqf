_caller = _this select 0;

// Context switching depending on the map we are using. Some actions are specifically for Operations or training.
// Additional features can be added now without impacting either server.
private _tpImage = "";
private _map = worldName;
private _tpName = "Teleporter";

switch (_map) do
{
	case "rof_mok": {
		_tpName = "Training Teleporter";
		_tpImage = "textures\mok_map.paa";
		//_aviationSpawn = [9804,18892,0];

		// Training Areas
		_caller addaction ["Range", 						{player setpos ([[9933,18310,0], 2, 10, 5, 0, 0, 0] call bis_fnc_findsafepos)}]; 
		_caller addaction ["Mortar FOB",					{player setpos ([[15475,9894,0], 2, 10, 5, 0, 0, 0] call bis_fnc_findsafepos)}]; 
		_caller addaction ["FIWAF FOB", 					{player setpos ([[17287,22967,0], 2, 10, 5, 0, 0, 0] call bis_fnc_findsafepos)}]; 
		_caller addaction ["Target Identification Range", 	{player setpos ([[11178,14538,0], 2, 10, 5, 0, 0, 0] call bis_fnc_findsafepos)}]; 
		_caller addaction ["Random Navigation Task", 		{player addaction ["Random Navigation", tcz_fnc_rtp]}]; 
		
		// Navigation TP
		_caller addaction ["Aviation Spawn", {player setpos ([getMarkerPos "aviation_respawn_location", 2, 10, 5, 0, 0, 0] call bis_fnc_findsafepos)}];
	};

	case "Napf":{
		_tpImage = "";
		_tpName = "Operations Teleporter";
	};
	
	default {
		_tpName = "Teleporter";
		_aviationSpawn = getMarkerPos "aviation_respawn_location";
	};
};

// General Actions
_caller addaction [_tpName, ''];
_caller addaction ["----------", ''];

_caller SetObjectTexture [0,_tpImage];