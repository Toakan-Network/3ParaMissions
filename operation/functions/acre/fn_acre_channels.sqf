// Created by Tad, SteamID: 76561197991835568
// Easy way to build radio presets. Provide what you want into the _nets array and let it go to work.
//
// Usage: 
// Change _nets array here to list whatever Channels you want to use.
// In Init.sqf use: call "scripts\init\acre.sqf";
// In initPlayerLocal.sqf use: [] execvm "scripts\init\acre.sqf";
//
//
// Acre check, no point setting if server / HC or if users aren't using ACRE.

//ACRE Channel Setup
private _radios = ["ACRE_PRC152", "ACRE_PRC117F"];
private _nets = ["HQCMD NET", "1PL NET", "2PL NET", "3PL NET", "FLUID NET 1", "FLUID NET 2", "A2A NET", "CAS NET", "FIRES NET", "CSS NET", "FINDER NET"];
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
	[_radio, _presetName] call acre_api_fnc_setPreset;
} foreach _radios;