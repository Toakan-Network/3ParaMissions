params ["_player", "_curator"];
[2, format ["%2 assigned to %1", name _player, _curator]] call tcz_fnc_log;

_curator addEventHandler ["CuratorObjectRegistered", { 
	params ["_curator"];
	private _scriptName = "fn_playerZeusLogging";
	private _message = format ["%1 has entered Zeus mode", profileName];
	[3,_message, _scriptName] call tcz_fnc_log;
}];

_curator addEventHandler ["CuratorObjectPlaced", {
	params ["_curator", "_entity"];
	private _scriptName = "fn_playerZeusLogging";
	private _message = format ["%1 has placed: %2", profileName, _entity];
	[3,_message, _scriptName] call tcz_fnc_log;
}];

_curator addEventHandler ["CuratorObjectDeleted", {
	params ["_curator", "_entity"];
	private _scriptName = "fn_playerZeusLogging";
	private _message = format ["%1 has deleted: %2", profileName, _entity];
	[3,_message, _scriptName] call tcz_fnc_log;
}];

