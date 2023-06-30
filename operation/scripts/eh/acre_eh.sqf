private _player = _this select 0;
private _filename = "acre_eh.sqf";

// Player AND Acre check, no point setting if server / HC or if users aren't using ACRE.
if (hasInterface AND (isClass (configFile >> "CfgPatches" >> "acre_main"))) then {
	[3, format ["Enabling ACRE for player %1", name _player], _filename] execvm "scripts\performance\log.sqf";
	// Enable Babel
	[true, true] call acre_api_fnc_setupMission;

	// Setup Languages 
	["en", "English"] call acre_api_fnc_babelAddLanguageType;
	["ab", "Arabic"] call acre_api_fnc_babelAddLanguageType;
	["ru", "Russian"] call acre_api_fnc_babelAddLanguageType;

	// Set Language per Side
    switch ( side (group _player) ) do {
        case west: {
            ["en"] call acre_api_fnc_babelSetSpokenLanguages;
        };
        case civilian: {
            ["ab","en","ru"] call acre_api_fnc_babelSetSpokenLanguages;
        };
        case east: {
            ["ru"] call acre_api_fnc_babelSetSpokenLanguages;
        };
        case independent: {
            ["ab"] call acre_api_fnc_babelSetSpokenLanguages;
        };
    };

	// Re-set radio settings on respawn START
	// Taken from 16AA Milsim: https://github.com/16AA-Milsim/MissionFramework/blob/master/initPlayerLocal.sqf
	_player addEventHandler ["Respawn",
	{
		private _newRadioList = [];
		_newRadioList set [0, 1];
		_newRadioList set [1, 1];
		_newRadioList set [2, 1];
		params ["_unit", "_corpse", "_newRadioList"];
		_unit setUnitLoadout [[_corpse] call acre_api_fnc_filterUnitLoadout, false]; //copy old radio items from corpse to respawned player
		{
			private _radioType = _x;
			private _radios = [_radioType, _corpse] call acre_api_fnc_getAllRadiosByType; //return array of unique Radio IDs from corpse
			private _radioChannel = [];
			private _radioVolume = [];
			private _radioSpatial = [];
			private _pttList = [];
			_pttRadioList = [] call acre_api_fnc_getMultiPushToTalkAssignment; //return array of radioIDs assigned to each PTT key
			{
				//iterate through all radios by IDs, add their properties to arrays in a set order
				private _radioID = _x;
				private _currentChannel = [_radioID] call acre_api_fnc_getRadioChannel; //get channel of Radio
				private _currentVolume = [_radioID] call acre_api_fnc_getRadioVolume; //get volume of Radio
				private _currentSpatial = [_radioID] call acre_api_fnc_getRadioSpatial; //get spatial of Radio
				switch (_radioID) do 
				{ 
					//if ptt1 radio, add int 1
					case (_pttRadioList select 0): 
					{ 
						(_pttList pushBack 1); 
					}; 
					//if ptt2 radio, add int 2
					case (_pttRadioList select 1): 
					{ 
						(_pttList pushBack 2); 
					}; 
					//if ptt3 radio, add int 3
					case (_pttRadioList select 2): 
					{ 
						(_pttList pushBack 3); 
					}; 
					//if radio without ptt set, add int 9
					default 
					{ 
						(_pttList pushBack 9); 
					}; 
				};
				_radioChannel pushBack _currentChannel; //add channel to radioChannel
				_radioVolume pushBack _currentVolume; //add volume to radioVolume
				_radioSpatial pushBack _currentSpatial; //add spatial to radioSpatial
			} forEach _radios;
			//now we have four arrays - radioChannel, radioVolume, radioSpatial and pttList setup for every radio the player had
			[{
				params ["_newUnit", "_radioType", "_radioChannel", "_radioVolume", "_radioSpatial", "_pttList", "_newRadioList"];
				private _radios = [_radioType, _newUnit] call acre_api_fnc_getAllRadiosByType;
				{
					//iterate through all NEW radios by IDs, add properties in the order set above
					private _radioID = _x;
					private _channel = _radioChannel select _forEachIndex;
					private _volume = _radioVolume select _forEachIndex;
					private _spatial = _radioSpatial select _forEachIndex;
					private _pttKey = _pttList select _forEachIndex;
					if (_pttKey == 1) then {_newRadioList set [0, _radioID]}; //assign new radio to PTT slot 1
					if (_pttKey == 2) then {_newRadioList set [1, _radioID]}; //assign new radio to PTT slot 2
					if (_pttKey == 3) then {_newRadioList set [2, _radioID]}; //assign new radio to PTT slot 3
					[_radioID, _channel] call acre_api_fnc_setRadioChannel;
					[_radioID, _volume] call acre_api_fnc_setRadioVolume;
					[_radioID, _spatial] call acre_api_fnc_setRadioSpatial;
				} forEach _radios;
			}, [_newUnit, _radioType, _radioChannel, _radioVolume, _radioSpatial, _pttList, _newRadioList], 3] call CBA_fnc_waitAndExecute; //delay 3 secs for new radio IDs
		} forEach ["ACRE_PRC77", "ACRE_PRC117F", "ACRE_PRC148", "ACRE_PRC152", "ACRE_PRC343", "ACRE_SEM52SL", "ACRE_SEM70", "ACRE_BF888S"]; // for each available ACRE RADIO
		[{
			params ["_newRadioList"];
			//assign the radio IDs of those with assigned PTTs
			private _ptt1 = _newRadioList select 0;
			private _ptt2 = _newRadioList select 1; 
			private _ptt3 = _newRadioList select 2; 
			_pttNewRadioList = [ [_ptt1, _ptt2, _ptt3] ] call acre_api_fnc_setMultiPushToTalkAssignment; //assign new radios to old PTT setup
			systemChat format ["Your radio settings have been restored."];
		}, [_newRadioList], 5] call CBA_fnc_waitAndExecute; //delay 5 secs to allow above block to complete
	}];
	// Re-set radio settings on respawn END
};