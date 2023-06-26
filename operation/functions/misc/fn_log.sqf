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

_errLevel = '';
_errMsg = '';
_errFile = '';

if(_this isEqualType []) then
{
        _errLevel = _this select 0;
        _errMsg = _this select 1;
        _errFile = _this param [2, "No File Specified"];
}
else {
    //This should only trigger if _this is not an array, which assumes it is string.
  _errLevel = 1;
  _errMsg = _this;
  _errFile = "No File Specified";
};

if (_errLevel == 0 || {isNil "_errLevel"} ) then {
    _errLevel = 1;
    };

if (_errLevel > LogLevel) exitwith {}; // for param use

// Sets up the actual log event.
_typex = "";
switch (_errLevel) do {
    case 1: {
        _typex = format ["%1: [3Para] | ERROR | %2 | %3",servertime, _errFile,_errMsg];
    };

    case 2: {
        _typex = format ["%1: [3Para] | INFO | %2",servertime, _errMsg];
    };

    case 3: {
        _typex = format ["%1: [3Para] | DEBUG | %2 | %3",servertime, _errFile,_errMsg];
    };

    default {
        _typex = format ["%1: [3Para] | Unknown Log Level Specified, please use 1= Errors, 2= Info, 3= Debug. Original error: %2",servertime, _errMsg]
    };
};

diag_log _typex;