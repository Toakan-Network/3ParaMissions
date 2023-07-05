private _filename = "initplayerlocal.sqf";
[2, "initPlayerLocal.sqf started."] execvm "scripts\performance\log.sqf";

// Dynamic Zeus Module.
[player, _filename] spawn {
	private _filename = _this select 1;
	[3, format ["Checking for Zeus logins"], _filename] execvm "scripts\performance\log.sqf";   
	[player] execvm "scripts\zeus\zeus_init.sqf";
};

[player, _filename] spawn {   
	private _player = _this select 0;
	private _filename = _this select 1;
	if ((getplayerUID _player in GCam_Users) || (getplayerUID _player in ServerAdmins)) then {   
		[3, format ["%1 is J9 Media, giving access to GCam.", name _player], _filename] execvm "scripts\performance\log.sqf";   
		_startGcam = ["gcam", "GCam", "", {execVM "scripts\gcam\gcam.sqf"}, {true}] call ace_interact_menu_fnc_createAction;   
		[(typeOf _player), 1, ["ACE_SelfActions"], _startGcam] call ace_interact_menu_fnc_addActionToClass;   
	};   
};

// Setup player Event Handlers;
[player] execvm "scripts\eh\player_eh.sqf";		// Player EH
[player] execvm "scripts\eh\zeus_ping.sqf";		// Zeus Ping EH
[player] execvm "scripts\init\acre_setup.sqf"; 	// ACRE Things
[player] call tcz_fnc_addAdminChannel;	// Add to Admin Channel

[2, "initPlayerLocal.sqf complete."] execvm "scripts\performance\log.sqf";
