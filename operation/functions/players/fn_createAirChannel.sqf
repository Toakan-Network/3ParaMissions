private _colour = [200, 130, 200, 0.4];
private _label = 'AIR';
private _callsign = '%CHANNEL_LABEL';
private _defaultUnits = [];
private _airChannel = radioChannelCreate [_colour, _label, _callsign, _defaultUnits];

private _errMsg = "Failed to create Admin Channel";
if (_airChannel == 0) exitWith {
		[1,_errMsg] call tcz_fnc_log;
};

airchannel = _airChannel;
publicVariable "airchannel";
airchannel;