private _player = _this select 0;
private _filename = "zeus_ping";

_player setVariable ["zeusPingTime", 0];
_player setVariable ["zeusPingLimit", 0];

_player addEventHandler ["CuratorPinged", {
	params ["_curator", "_unit"];

	private _pingTime = _unit getVariable ["zeusPingTime", 0];
	if (_pingTime == round(time)) exitWith {};
	_unit setVariable ["zeusPingTime", round(time)];

	private _curatorFound = allPlayers findIf {_x getVariable ["isZeus", false]};
	if ( _curatorFound == -1 ) exitWith {
		"Zeus is not online at the moment. If you have an urgent matter, notify admins on discord with the !admin command." remoteExecCall ["hint", _unit];
	};

	private _pingLimit = _unit getVariable ["zeusPingLimit", 0];
	_pingLimit = _pingLimit + 1;
	if (_pingLimit > 3) then {
	["ZEUS PINGED", "You exceeded the maximum amount of times you're allowed to ping zeus."] remoteExecCall ["hintC", _unit];
		[_unit] remoteExecCall ["forceRespawn", _unit];
	} else {
		["ZEUS PINGED", "Zeus has been made aware of your request. Your ping has been transmitted, and further pings will produce this hint."] remoteExecCall ["hintC", _unit];
	};

	_unit setVariable ["zeusPingLimit", _pingLimit];
	[ _unit ] spawn {
		sleep 60;
		params ["_unit"];
		private _pingLimit = _unit getVariable ["zeusPingLimit", 0];
		_pingLimit = _pingLimit - 1;
		if (_pingLimit > 0) then {
			_unit setVariable ["zeusPingLimit", _pingLimit];
		};
	};

	[2, format ["[Zeus Ping] ping received from %1 (%2)", name _unit, getPlayerUID _unit]] execvm "scripts\performance\log.sqf";
}];
[3, format ["Script complete - %1", name _player], _filename] execvm "scripts\performance\log.sqf";  