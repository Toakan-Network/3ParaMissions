private _filename = "zeus_whitelist.sqf";
private _players = allPlayers - entities "HeadlessClient_F";
private _zeus = [];

{
	if (!isNull (getAssignedCuratorUnit _x)) then {
		_player = getAssignedCuratorUnit _x;
		[2, format ["Player: %1 is in Zeus, adding to checks.",name _player]] execvm "scripts\performance\log.sqf";
		_zeus pushBack _player;
	};
} foreach allCurators;

[3, "Zeus Whitelist Check", _filename] execvm "scripts\performance\log.sqf";
{
	private _zeusSlot = _x getVariable ["isZeus", false];
	private _uid = getPlayerUID _x;
	private _zeusModule = getAssignedCuratorLogic _x;
	private _playerName = name _x;
	private _playerMachine = owner _x;
	[2, format ["Checking %1, against the whitelist.",_playerName]] execvm "scripts\performance\log.sqf";

	switch (true) do
	{ 
		//case (!(_zeusModule) && !(_zeusSlot) && !(_uid in _serveradmins)): 
		//{
		//	[1, format ["Check 1 :: Player: %1 was found in Zeus who shouldn't be.",_playerName], _filename] execvm "scripts\performance\log.sqf";
		//	"Zeus_1" remoteExec ["endMission", _playerMachine];
		//};

		case ((_zeusSlot) && (!(_uid in Trainers) && !(_uid in Zeus_IDs))):
		{
			[1, format ["Check 2 :: Player: %1 unauthorized player in Zeus.",_playerName], _filename] execvm "scripts\performance\log.sqf";
			unassignCurator _zeusModule;
			
			// "Zeus_Trainer" remoteExec ["endMission", _playerMachine];
		};

		default {
			[2, format ["Check 0 :: Player: %1, ID: %2, Status: OK",_playerName, _uid]] execvm "scripts\performance\log.sqf";
		};
	};

} foreach _zeus;
