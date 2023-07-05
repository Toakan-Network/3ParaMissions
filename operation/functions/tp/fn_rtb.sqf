// Return player to known safe place, ie Spawn.
private _player = _this select 0;
private _knownLoc = [9853,19569,0];
removeallactions _player;
_player setpos ([_knownLoc, 2, 15, 5, 0, 0, 0] call bis_fnc_findsafepos);
_player addItem "ItemGPS";
_player assignItem "ItemGPS";
