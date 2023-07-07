[2, "initPlayerLocal.sqf started."] call tcz_fnc_log;

[player] call tcz_fnc_gcamSetup;

// Zeus Handler
[player] spawn {
	params ["_player"];
	waituntil {
		(!(isNull (getAssignedCuratorLogic _player)))
	};
	private _curator = getAssignedCuratorLogic _player;
	[_player, _curator] call tcz_fnc_playerZeusLogging;
};

// Setup player Event Handlers;
[player] execvm "scripts\eh\player_eh.sqf";		// Player EH
[player] execvm "scripts\eh\zeus_ping.sqf";		// Zeus Ping EH
[player] call tcz_fnc_acre_setup; 	// ACRE Things
[player] call tcz_fnc_addAdminChannel;	// Add to Admin Channel

[2, "initPlayerLocal.sqf complete."] call tcz_fnc_log;
