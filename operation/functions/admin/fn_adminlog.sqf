// Admin logging events.
params ["_unit", "_msg"];
if (isnil "adminChannel") then {
	call tcz_fnc_createAdminChannel;
};

private _adminchannel = missionnamespace getVariable "adminChannel"; 
private _admins = (radioChannelInfo _adminChannel) select 3;
{
	[_x, [_adminchannel, _msg]] remoteexec ["customchat", _x];
} foreach _admins;

