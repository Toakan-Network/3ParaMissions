removeallactions player;


player addaction ["Return to Base", {player setpos ([[9853,19569,0], 2, 15, 5, 0, 0, 0] call bis_fnc_findsafepos)}]; 
 
this addaction ["Random Navigation Task", {player addaction ["Random Navigation]", "scripts\fun\rtp.sqf"}];
