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

if (!isServer) exitWith {
    _this remoteExec ["tcz_fnc_zlog", 2];
};

params [
    "_msg",
    ["_Filename", "LOG"],
    ["_sendInAdminChannel", false]
];

private _message = format ["[%1] %2", (toUpper _Filename), _msg];

[2, _message] call tcz_fnc_log;

