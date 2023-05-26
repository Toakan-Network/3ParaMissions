private _serveradmins = StaffList + InA_Server_spartanUIDs;
private _trainingteam = InA_Server_TrainingUIDs + _serveradmins;
private _filename = "zeus_whitelist.sqf";
private _players = allPlayers - entities "HeadlessClient_F";

private _zeus = [];
{
	if (!isNull (getAssignedCuratorUnit _x)) then {
		_zeus pushBack (getAssignedCuratorUnit _x);
	};
} foreach allCurators;

[3, "Zeus Whitelist Check", _filename] execvm "scripts\performance\log.sqf";
{
	private _zeusSlot = _x getVariable ["isZeus", false];
	private _uid = getPlayerUID _x;
	private _zeusModule = isnull (getAssignedCuratorLogic _x);
	private _playerName = name _x;
	private _playerMachine = owner _x;

	switch (true) do
	{
		//case (!(_zeusModule) && !(_zeusSlot) && !(_uid in _serveradmins)): 
		//{
		//	[1, format ["Check 1 :: Player: %1 was found in Zeus who shouldn't be.",_playerName], _filename] execvm "scripts\performance\log.sqf";
		//	"Zeus_1" remoteExec ["endMission", _playerMachine];
		//};

		case ((_zeusSlot) && !(_uid in _trainingteam)):
		{
			[1, format ["Check 2 :: Player: %1 unauthorized player in Zeus slot.",_playerName], _filename] execvm "scripts\performance\log.sqf";
			"Zeus_Trainer" remoteExec ["endMission", _playerMachine];
		};

		default {
			[2, format ["Check 0 :: Player: %1, ID: %2, Status: OK",_playerName, _uid]] execvm "scripts\performance\log.sqf";
		};
	};

} foreach _zeus;
