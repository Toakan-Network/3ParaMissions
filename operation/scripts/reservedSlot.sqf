/* 
*/
[2, "reservedSlot.sqf starting."] execvm "scripts\performance\log.sqf";

waitUntil {(vehicle player) == player};
waitUntil {(getPlayerUID player) != ""};

// Stores the connecting player's UID //
_uid = getPlayerUID player;	
_whitelist = missionNamespace getVariable "whitelist_enabled";

IF (_whitelist) THEN 
[{
	private ["_reserved_units", "_reserved_uids", "_uid"];
	// list of restricted slots and Variable name for the slot
	// Instructors are [z1,z2,z3]
	_reserved_units = [z1,z2,z3];

	// The player UID is a 17 digit number found in the profile tab. //
	_reserved_uids = 
	[
		"UID765611979918355682"/* Tad */
	];
	

	if (player getVariable ["isZeus", false]) then {
	};
	
	if ((player in _reserved_units) && !(_uid in _reserved_uids)) then 
		{
			[2, "Unauthorised Player in reserved slot"] execvm "scripts\performance\log.sqf";
			titleText ["", "BLACK OUT"];
			disableUserInput true;
			hint "You are in a reserved slot! You will be kicked to the lobby in 10 seconds!";
			sleep 5;
			hint "You are in a reserved slot! You will be kicked to the lobby in 5 seconds!";
			sleep 5;
			titleText ["", "BLACK IN"];
			disableUserInput false;
			failMission "end1";
  	};  
}];