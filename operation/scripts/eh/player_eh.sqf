private _player = _this select 0;
private _filename = "player_eh.sqf";

_player addEventHandler ["Hit", {
	params ["_unit", "_source", "_damage", "_instigator"];
	_isFriendlyFire = side group _instigator isEqualTo side group _unit;
	_msg = format ["Warning: %1 is shooting friendly %2. ", name _instigator, name _unit];
	if _isFriendlyFire then {
		[_unit, _msg] call tcz_fnc_adminlog;
		[2, _msg] remoteexec ["tcz_fnc_log", 2];  
	};
}];

_player addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	_isFriendlyFire = side group _instigator isEqualTo side group _unit;
	_msg = format ["%1 killed %2. ", name _instigator, name _unit];
	if _isFriendlyFire then {
		[_unit, _msg] call tcz_fnc_adminlog;
		[2, _msg] remoteexec ["tcz_fnc_log", 2];  
	};
}];
[3, format ["Script complete - %1 for %2.",_filename,  name _player], _filename] execvm "scripts\performance\log.sqf";  
