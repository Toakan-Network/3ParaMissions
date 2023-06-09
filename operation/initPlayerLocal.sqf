[2, "initPlayerLocal.sqf started."] execvm "scripts\performance\log.sqf";

// Dynamic Zeus Module.
[player] spawn {
	private _player = _this select 0;
	private _playerName = name _player;
	private _pOwner = str (owner _player);
	// Does Zeus player have a module attached?
	if (((_player in Zeus_IDs) || (_player in ServerAdmins)) && isNull (getAssignedCuratorLogic _player)) then {
		[2, format ["%1 is a registered Zeus, assigning module.", _playerName]] execvm "scripts\performance\log.sqf";   

		// Setup a Zeus Module.
		private _zeusModuleName = _playerName + "_zeus";

		// Assign the Zeus Module to the player.
		curatorGroup = createGroup [sideLogic, true];
		private _curatorModule = curatorGroup createunit [_zeusModuleName, [0, 90, 90], [], 0.5, "NONE"];
		_player assignCurator _curatorModule;

		// Sets up required Variables
		player setVariable ["isZeus", true];
		player setVariable ['curatorModule', _curatorModule];
		_curatorModule setVariable ["owner", _pOwner, true];
		_curatorModule setVariable ["curatorUnitOwner", _pOwner];
	};
	// Setup additional Event Handlers
	if (_player getVariable ["isZeus", false]) then {
		[2, format ["Setting Zeus events for %1.", name player]] execvm "scripts\performance\log.sqf";
		player call compile preprocessFileLineNumbers "scripts\zeus\zeus_events.sqf";
	};
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
