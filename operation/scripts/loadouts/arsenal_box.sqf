// Usage
// [this] execVM "scripts\arsenal_box.sqf";

_box = _this select 0;

_box addAction ["Section/Platoon Loadouts", "", [], 12, false, false, "", "", 5]; 
_box addAction [" > Rifleman", "scripts\loadouts\infantry\rifleman.sqf", [], 11, false, false, "", "", 5]; 
_box addAction [" > Rifleman ASM", "scripts\loadouts\infantry\riflemanasm.sqf", [], 10, false, false, "", "", 5]; 
_box addAction [" > Rifleman NLAW", "scripts\loadouts\infantry\riflemannlaw.sqf", [], 9, false, false, "", "", 5]; 
_box addAction [" > Team Medic", "scripts\loadouts\infantry\riflemanteammedic.sqf", [], 8, false, false, "", "", 5];
_box addAction [" > Sharpshooter", "scripts\loadouts\infantry\sharpshooter.sqf", [], 7, false, false, "", "", 5]; 
_box addAction [" > Section IC/2IC", "scripts\loadouts\infantry\sectionic2ic.sqf", [], 6, false, false, "", "", 5];
_box addAction [" > GPMG", "scripts\loadouts\infantry\gpmg.sqf", [], 5, false, false, "", "", 5];
_box addAction [" > Platoon Commander", "scripts\loadouts\infantry\plthq.sqf", [], 4, false, false, "", "", 5];
_box addAction [" > Platoon Sergeant", "scripts\loadouts\infantry\plthq.sqf", [], 3, false, false, "", "", 5];
_box addAction [" > Platoon Radio Operator", "scripts\loadouts\infantry\pltradop.sqf", [], 2, false, false, "", "", 5];
_box addAction [" > Combat Medical Technician", "scripts\loadouts\infantry\cmt.sqf", [], 1, false, false, "", "", 5];