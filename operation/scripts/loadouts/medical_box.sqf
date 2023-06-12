// Testing new loadout apply system. Should be quicker than one item at a time.
_box = _this select 0;
private _loadoutFile = "scripts\loadouts\loadouts.sqf";

_box addAction ["Medical Loadouts", "", [], 24, false, false, "", "", 5]; 
_box addAction [" > Team Medic", 	_loadoutFile, "teammedic", 7, false, false, "", "", 5]; 
_box addAction [" > Combat Medical Tech", 	_loadoutFile, "cmt", 1, false, false, "", "", 5]; 
