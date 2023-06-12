// Testing new loadout apply system. Should be quicker than one item at a time.
_box = _this select 0;
private _loadoutFile = "scripts\loadouts\loadouts.sqf";

_box addAction ["Pathfinder Loadouts", "", [], 24, false, false, "", "", 5]; 
_box addAction [" > PF Rifleman", 		_loadoutFile, "pf-rifleman", 9, false, false, "", "", 5]; 
_box addAction [" > PF Selection", 		_loadoutFile, "pf-selection", 8, false, false, "", "", 5]; 
