params ["_playerOBJ"];
private _player = _playerOBJ;
// Race condition, can't add you to the channel if it's not made yet.

private _isAir = _playerOBJ getVariable ["IsAirSlot", false];
if !(_isAir) exitWith {};
waituntil {!(isnil "airChannel");};

private _airchannel = airChannel;
// Server admins get added to Admin channel
_airchannel radioChannelAdd [_player];
[2, format ["Added %1 to Air channel", name _player]] call tcz_fnc_log;