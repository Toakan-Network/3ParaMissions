// Random Tele-Porter.sqf 
// For use on the training server only, otherwise you'll end up somwhere random...

removeallactions player;
player unassignItem "ItemGPS";
player removeItem "ItemGPS";

player setpos ([[9853,19569,0], 250, 3000, 5, 0, 0, 0] call bis_fnc_findsafepos);
player addaction ["Return to Base", "scripts\nav\rtb.sqf"]; 