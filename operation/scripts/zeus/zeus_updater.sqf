// zeus_updater.sqf
if (!isServer) exitWith {};

private _interval = 120;
private _lastRun = serverTime;

[2, format ["Zeus Updater loop starting."]] call tcz_fnc_log;

while {zeus_updater} do {
    if (serverTime < (_lastRun + _interval)) then {
        sleep 5;
        continue;
    };

    _lastRun = serverTime;

    private _objects = (call tcz_fnc_getEditableObjects);

    {
        [_x, _objects] call tcz_fnc_updateEditableObjects;
    } forEach allCurators;
};

[2, format ["Zeus Updater loop stopped."]] call tcz_fnc_log;