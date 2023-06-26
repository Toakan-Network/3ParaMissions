/*
 * Author: Whigital
 *
 * Description:
 * Adds unit to Admin Channel
 *
 */

params [["_unit", objNull]];
private _scriptName = "addtoAdminChannel";

if (!isServer) exitWith {};

if (isRemoteExecuted && {!([remoteExecutedOwner] call tcz_fnc_isZeus)}) exitWith {
    private _caller = objNull;
    private _players = allPlayers;

    private _playerIdx = (_players findIf {(owner _x) == remoteExecutedOwner});

    if (_playerIdx != -1) then {
        _caller = (_players # _playerIdx);
    };

    private _msg = (format ["%1 :: Non Zeus player %2 (%3) tried to add themselves to the adminchannel!", _scriptName, (name _caller), (getPlayerUID _caller)]);
    [_msg, "VIOLATION", true] call tcz_fnc_zlog;
};

private _channelInfo = (radioChannelInfo InA_Server_adminChannelID);

if (((_channelInfo # 3) findIf {(vehicleVarName _x) == (vehicleVarName _unit)}) == -1) then {
    InA_Server_adminChannelID radioChannelAdd [_unit];
};
