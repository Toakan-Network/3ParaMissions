params ["_playerOBJ"];
private _player = _playerOBJ;
// Race condition, can't add you to the channel if it's not made yet.
waituntil {!(isnil "adminchannel");};
private _adminchannel = adminChannel;


if (isnil "adminChannel") then {
	_adminchannel = call tcz_fnc_createAdminChannel;
};

if (getplayeruid _player in ServerAdmins) then {
		// Server admins get added to Admin channel
	_adminchannel radioChannelAdd [_player];
	[2, format ["Added %1 to Admin channel", name _player]] call tcz_fnc_log;
};

