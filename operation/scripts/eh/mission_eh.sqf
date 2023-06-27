private _filename = "mission_eh.sqf";

addMissionEventHandler ["PlayerConnected", {
	params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];
	[2, format ["%1 Player connected.", _name]] execvm "scripts\performance\log.sqf";   

	// Does Zeus player have a module attached?
	if (((_uid in Zeus_IDs) || (_uid in ServerAdmins)) && isNull (getAssignedCuratorLogic _player)) then {
		private _player = (allPlayers select {owner _x == _owner}) select 0;
		private _playerName = name _player;

		[3, format ["%1 is a registered Zeus, assigning module.", _playerName], "mission_eh.sqf"] execvm "scripts\performance\log.sqf";   
		
		// Setup a Zeus Module.
		private _zeusModuleName = _playerName + "_zeus";

		// Assign the Zeus Module to the player.
		curatorGroup = createGroup [sideLogic, true];
		private _curatorModule = curatorGroup createunit [_zeusModuleName, [0, 90, 90], [], 0.5, "NONE"];
		_player assignCurator _curatorModule;

		// Sets up required Variables
		player setVariable ["isZeus", true];
		player setVariable ['curatorModule', _curatorModule];
		_curatorModule setVariable ["owner", _owner, true];
		_curatorModule setVariable ["curatorUnitOwner", _owner];

		player call compile preprocessFileLineNumbers "scripts\zeus\zeus_events.sqf";
	};
}];
[3, format ["Script complete - %1", _filename], _filename] execvm "scripts\performance\log.sqf";  