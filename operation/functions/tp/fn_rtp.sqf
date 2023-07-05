// Random Tele-Porter.sqf 
// For use on the training server only, otherwise you'll end up somwhere random...
private _player = _this select 0;
private _spawnLoc = [9853,19569,0];

removeallactions _player;
_player unassignItem "ItemGPS";
_player removeItem "ItemGPS";

_player setpos ([_spawnLoc, 250, 3000, 5, 0, 0, 0] call bis_fnc_findsafepos);
_player addaction ["Return to Base", tcz_fnc_rtb]; 