// Log the shit that Zeus does...
// Zeus Logging
{
    _x addEventHandler ["CuratorObjectRegistered", { 
        params ["_curator"];
        private _scriptName = "Zeus Log";
        private _message = format ["%1 has entered Zeus mode", profileName];
        [3,_message, _scriptName] call tcz_fnc_log;
    }];

    _x addEventHandler ["CuratorObjectPlaced", {
        params ["_curator", "_entity"];
        private _scriptName = "Zeus Log";
        private _message = format ["%1 has placed: %2", profileName, _entity];
        [3,_message, _scriptName] call tcz_fnc_log;
    }];

    _x addEventHandler ["CuratorObjectDeleted", {
        params ["_curator", "_entity"];
        private _scriptName = "Zeus Log";
        private _message = format ["%1 has deleted: %2", profileName, _entity];
        [3,_message, _scriptName] call tcz_fnc_log;
    }];

} foreach allCurators; //_zeus;