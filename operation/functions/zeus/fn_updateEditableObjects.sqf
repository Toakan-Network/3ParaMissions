/*
 * Author: Whigital
 * Description:
 * Adds objects to curator module
 *
 */
if (!isServer) exitWith {};
params [
    "_curator",
    ["_objects", []]
];
private _scriptname = "fn_updateEditableObjects";
private _curatorObjects = (curatorEditableObjects _curator);
_objects append (call tcz_fnc_getEditableObjects);

private _objsToAdd = (_objects - _curatorObjects);
if (_objsToAdd isEqualTo []) exitwith {[3, "Nothing to add."] call tcz_fnc_log};

_curator addCuratorEditableObjects [_objsToAdd, true];
[3, format["%1 Adding: %2",_curator, _objsToAdd], _scriptname] call tcz_fnc_log;
