// Acre check, no point setting if server / HC or if users aren't using ACRE.
if (isClass (configFile >> "CfgPatches" >> "acre_main")) then {
	[2, "Setting up Acre Channels."] execvm "scripts\performance\log.sqf";
	//ACRE Channel Setup
	private _radios = ["ACRE_PRC152", "ACRE_PRC117F"];
	private _nets = ["HQCMD NET","A Company", "1Pl NET", "2Pl NET", "3Pl NET", "Fluid NET 1", "Fluid NET 2", "A2A NET", "CAS NET", "FIRES NET", "FINDER NET"];
	{
		_radio = _x;
		_presetName = "3para";
		_set = "";
		[_radio, "default", _presetName] call acre_api_fnc_copyPreset;
		{	
			_channelID = _foreachIndex;
			_net = _x;
			if (_radio isEqualTo "ACRE_PRC152") then {
				_set = "description";
			};
			if (_radio isEqualTo "ACRE_PRC117F") then {
				_set = "name";
			};
			[_radio, _presetName, _channelID +1, _set, _net] call acre_api_fnc_setPresetChannelField;
		} foreach _nets;
		[_x, _presetName] call acre_api_fnc_setPreset;
	} foreach _radios;
};