// Testing new loadout apply system. Should be quicker than one item at a time.
_box = _this select 0;
private _loadoutFile = "scripts\loadouts\test\loadouts.sqf";

_box addAction ["Infantry Loadouts", "", [], 20, false, false, "", "", 5]; 
_box addAction [" > IC / 2IC", 		_loadoutFile, "ic", 9, false, false, "", "", 5]; 
_box addAction [" > Rifleman", 		_loadoutFile, "rifleman", 8, false, false, "", "", 5]; 
_box addAction [" > Team Medic", 	_loadoutFile, "teammedic", 7, false, false, "", "", 5]; 
_box addAction [" > Sharpshooter", 	_loadoutFile, "sharpshooter", 6, false, false, "", "", 5]; 
_box addAction [" > GPMG", 			_loadoutFile, "gpmg", 5, false, false, "", "", 5]; 
_box addAction [" > Pointman", 		_loadoutFile, "pointman", 4, false, false, "", "", 5]; 
_box addAction [" > Grenadier", 	_loadoutFile, "grenadier", 3, false, false, "", "", 5]; 
_box addAction [" > Combat Medical Tech", 	_loadoutFile, "cmt", 1, false, false, "", "", 5]; 
