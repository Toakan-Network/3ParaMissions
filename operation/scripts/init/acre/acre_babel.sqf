private _player = _this select 0;
private _filename = "acre_babel.sqf";

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
