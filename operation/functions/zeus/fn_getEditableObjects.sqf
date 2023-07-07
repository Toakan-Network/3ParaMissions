/*
 * Author: Whigital
 * Description:
 * Generates array of objects/units for curator addition
 *
 */

if (!isServer) exitWith {};
private _scriptname = "fn_getEditableObjects";
private _quarterMasters = (getArray (missionConfigFile >> worldName >> "arsenalObjects"));
private _stevies = [];

{
    private _stevie = (missionNamespace getVariable [_x, objNull]);
    if (!isNull _stevie) then {
        _stevies pushBack _stevie;
    };
} forEach _quarterMasters;

private _objs = (
    (
        (entities "AllVehicles") 
        + (entities "Soldier")
    ) - (
        (entities "Animal") +
        (entities "Logic") +
        _stevies
    )
);

_objs;
