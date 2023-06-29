// To add a new box copy the row below and change the box name, IE Alpha > Echo in both the 1st and 3rd parameter..
// 
_spawner = _this select 0;
_populationScript = compile PreProcessFileLineNumbers "scripts\garrisons\objectives\populate.sqf";
// {execVM "scripts\garrisons\objectives\populate.sqf"}
_spawner addAction ["Mission Request", "", [], 20, false, false, "", "", 5]; 
_spawner addAction ["---------------", "", [], 19, false, false, "", "", 5]; 
_spawner addaction ["Retake Southend", 		_populationScript, ["ao_marker_southend",	1], 19, false, false, "", "", 5];
_spawner addaction ["Retake Campbeltown", 	_populationScript, ["ao_marker_campbeltown",	1], 18, false, false, "", "", 5];
_spawner addaction ["FIWAF Invasion", 		_populationScript, ["ao_marker_fiwaf",2], 	17, false, false, "", "", 5];
_spawner addaction ["FIBUA Training", 		_populationScript, ["ao_marker_fibua",1], 	16, false, false, "", "", 5];
_spawner addaction ["Defend the HQ", 		_populationScript, ["ao_marker_hq",1], 		15, false, false, "", "", 5];
