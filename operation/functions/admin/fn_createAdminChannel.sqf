private _colour = [178, 0, 245, 1];
private _label = 'ADMIN';
private _callsign = '%CHANNEL_LABEL';
private _defaultUnits = [];
private _adminChannel = radioChannelCreate [_colour, _label, _callsign, _defaultUnits];

private _errMsg = "Failed to create Admin Channel";
if (_adminChannel == 0) exitWith {
		[1,_errMsg] call tcz_fnc_log;
};

adminchannel = _adminChannel;
publicVariable "adminChannel";
adminChannel;