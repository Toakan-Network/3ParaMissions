// This is Validation
// Param 1 = Error Level (Error, Info, Debug)
// Param 2 = Log Message
// Param 3 = Invoking File
// 
// "Default Error" execvm "log.sqf";
// [1,"Error Logging","log.sqf"] execvm "log.sqf";
// [2,"Info Logging"] execvm "log.sqf";
// [3,"Debug Logging","log.sqf"] execvm "log.sqf";
//
//
// Written by Tad Oct-31-2019
/*
    Description:
        A simple logging function that'll write to the RPT & if needed log to admin channel
    Author:
        Stanhope

    Params:
        _msg:                   anything:   what you want to log
        _prefix:                string:     the prefix, e.g. error, mainAO, ...
        _sendInAdminChannel:    boolean:    true send to admin channel, false for not.
*/

if (!isServer) exitWith {
    _this remoteExec ["tad_fnc_log", 2];
};

params [
    "_msg",
    ["_prefix", "LOG"],
    ["_sendInAdminChannel", false]
];

private _assembled = format ["[%1] %2", (toUpper _prefix), _msg];

[2, _assembled] execvm "scripts\performance\log.sqf";

