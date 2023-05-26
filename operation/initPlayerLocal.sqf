[2, "initPlayerLocal.sqf started."] execvm "scripts\performance\log.sqf";

// Setup additional Event Handlers
if (player getVariable ["isZeus", false]) then {
	[2, format ["%1 is in a Zeus slot.", name player]] execvm "scripts\performance\log.sqf";
	player call compile preprocessFileLineNumbers "scripts\zeus\zeus_events.sqf";
};

[player] spawn {   
	private _player = _this select 0;
	if ((getplayerUID _player in GCam_Users) || (getplayerUID _player in ServerAdmins)) then {   
		[2, format ["%1 is J9 Media, giving access to GCam.", name _player]] execvm "scripts\performance\log.sqf";   
		_startGcam = ["gcam", "GCam", "", {execVM "scripts\gcam\gcam.sqf"}, {true}] call ace_interact_menu_fnc_createAction;   
		[(typeOf _player), 1, ["ACE_SelfActions"], _startGcam] call ace_interact_menu_fnc_addActionToClass;   
	};   
};

[2, "initPlayerLocal.sqf complete."] execvm "scripts\performance\log.sqf";
