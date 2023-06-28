// To add a new box copy the row below and change the box name, IE Alpha > Echo in both the 1st and 3rd parameter..
// 
_spawner = _this select 0;
_spawner addaction ["Mission Request"];
_spawner addaction ["---------------"];
_spawner addaction ["Retake Southend", {execVM 'scripts\garrisons\objectives\populateSouthend.sqf'}];