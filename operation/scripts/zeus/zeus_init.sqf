private _player = _this select 0;
private _playerName = name _player;
private _pOwner = str (owner _player);

// Setup additional Event Handlers
if (_player getVariable ["isZeus", false]) then {
	[2, format ["Setting Zeus events for %1.", name player]] call tcz_fnc_log;
	player call compile preprocessFileLineNumbers "scripts\zeus\zeus_events.sqf";
};