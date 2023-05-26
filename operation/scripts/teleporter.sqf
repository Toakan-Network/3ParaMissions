_caller = _this select 0;

_caller SetObjectTexture [0,"textures\mok_map.paa"];
_caller addaction ["Training Teleporter", ''];
_caller addaction ["----------", ''];
// Training Areas
_caller addaction ["Range", {player setpos ([[9933,18310,0], 2, 10, 5, 0, 0, 0] call bis_fnc_findsafepos)}]; 
_caller addaction ["Mortar FOB", {player setpos ([[15475,9894,0], 2, 10, 5, 0, 0, 0] call bis_fnc_findsafepos)}]; 
_caller addaction ["FIWAF FOB", {player setpos ([[17287,22967,0], 2, 10, 5, 0, 0, 0] call bis_fnc_findsafepos)}]; 
_caller addaction ["Target Identification Range", {player setpos ([[11178,14538,0], 2, 10, 5, 0, 0, 0] call bis_fnc_findsafepos)}]; 
// Navigation TP
_caller addaction ["Random Navigation Task", {player addaction ["Random Navigation", "scripts\nav\rtp.sqf"]}]; 
_caller addaction ["Aviation Spawn", {player setpos ([[9804,18892,0], 2, 10, 5, 0, 0, 0] call bis_fnc_findsafepos)}]; 