/*
 * Author: Whigital
 *
 * Description:
 * Creates and assigns Curator module based access
 *
 */

params [["_unit", objNull]];

if (!isServer) exitWith {
    [
        format ["tcz_fnc_assignZeus executed on client '%1' for player '%2' with uid '%3'", clientOwner, (name _unit), (getPlayerUID _unit)],
        "ZEUS",
        true
    ] remoteExec ["tcz_fnc_zlog", 2];
};

if (isNull _unit) exitWith {};

if (!canSuspend) exitWith {
    _this spawn tcz_fnc_assignZeus;
};

private _uid = (getPlayerUID _unit);
private _name = (name _unit);

private _isZeus = (_uid in (InA_Server_coreStaffUIDs + InA_Server_staffUIDs + InA_Server_spartanUIDs));

if (_isZeus) then {
    private _zeusModule = (missionNamespace getVariable [(format ["InA_DynCurator_%1", _uid]), objNull]);
    private _moduleCreated = false;

    if (isNull _zeusModule) then {
        private _group = (createGroup sideLogic);
        _zeusModule = (_group createUnit ["ModuleCurator_F", [0, 0, 0], [], 0, "NONE"]);

        missionNamespace setVariable [(format ["InA_DynCurator_%1", _uid]), _zeusModule];

        _zeusModule setVariable ["Addons", 3, true];
        _zeusModule setVariable ["showNotification", false, true];
        _zeusModule setVariable ["birdType","", true];

        _group deleteGroupWhenEmpty true;
        _moduleCreated = true;
    };

    if (!isNull (getAssignedCuratorUnit _zeusModule)) then {
        unassignCurator _zeusModule;

        waitUntil {
            sleep 0.1;
            (isNull (getAssignedCuratorUnit _zeusModule))
        };
    };

    _unit assignCurator _zeusModule;

    waitUntil {
        sleep 0.1;
        ((getAssignedCuratorUnit _zeusModule) == _unit)
    };

    _unit setVariable ["InA_isZeus", true, true];

    if (_uid in InA_Server_coreStaffUIDs) then {
        _unit setVariable ["InA_isCoreStaff", true, true];
        _unit setVariable ["InA_isAdmin", true, true];
        [(format ["Zeus (Core Staff) assigned to %1 (%2)", _name, _uid]), "ZEUS", false] call tcz_fnc_zlog;
    };

    if (_uid in InA_Server_staffUIDs) then {
        _unit setVariable ["InA_isAdmin", true, true];
        [(format ["Zeus (Admin) assigned to %1 (%2)", _name, _uid]), "ZEUS", false] call tcz_fnc_zlog;
    };

    if (_uid in InA_Server_spartanUIDs) then {
        [(format ["Zeus (Spartan) assigned to %1 (%2)", _name, _uid]), "ZEUS", false] call tcz_fnc_zlog;
    };

    if (_moduleCreated) then {
        [_zeusModule] call tcz_fnc_updateEditableObjects;
    };

    _zeusModule remoteExec ["tcz_fnc_curatorEHs", _unit];

    [_unit] remoteExec ["tcz_fnc_zeusKeyBindEh", _unit];
    [_unit] remoteExec ["tcz_fnc_zeusToolsAddAction", _unit];
    [_unit] call tcz_fnc_addToAdminChannel;
} else {
    private _isHost = ((owner _unit) == 2);
    private _isLogged = ((admin (owner _unit)) == 2);

    if (!isNull (getAssignedCuratorLogic _unit) && {!_isHost || !_isLogged}) then {
        private _module = (getAssignedCuratorLogic _unit);

        unassignCurator _module;

        deleteVehicle _module;

        [(format ["Unassigned and removed Curator module for non Zeus player %1 (%2)", (name _unit), (getPlayerUID _unit)]), "ZEUS", true] call tcz_fnc_zlog;
    };

    _unit setVariable ["InA_isCoreStaff", false, true];
    _unit setVariable ["InA_isAdmin", false, true];
    _unit setVariable ["InA_isZeus", false, true];
};
