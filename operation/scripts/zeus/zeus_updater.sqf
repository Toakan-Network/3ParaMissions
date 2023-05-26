// zeus_updater.sqf
if (!isServer) exitWith {};

private _interval = 120;
private _lastRun = serverTime;

[2, format ["Zeus Updater loop starting."]] execvm "scripts\performance\log.sqf";

while {zeus_updater} do {
    if (serverTime < (_lastRun + _interval)) then {
        sleep 5;
        continue;
    };

    _lastRun = serverTime;

    private _objects = (call tad_fnc_getEditableObjects);

    {
        [_x, _objects] call tad_fnc_updateEditableObjects;
    } forEach allCurators;
};

[2, format ["Zeus Updater loop stopped."]] execvm "scripts\performance\log.sqf";