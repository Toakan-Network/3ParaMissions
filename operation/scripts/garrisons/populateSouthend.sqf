/*
Populate small base at the Military island
*/

// Empty vehicles

 
_car01 = "B_MRAP_01_F" createVehicle [11651.3,4457.85,0]; 
_car01 setDir 260; 
_car01 setFuel 0.25; 
_car01 setPosATL [11651.3,4457.85,0]; 
_car01 enableDynamicSimulation true; 
 
_car02 = "B_Quadbike_01_F" createVehicle [13058,5298,0]; 
_car02 setDir 180; 
_car02 setFuel 0.235; 
_car02 setPosATL [13058,5298,0]; 
_car02 enableDynamicSimulation true; 
 
{clearMagazineCargoGlobal _x; clearWeaponCargoGlobal _x; clearBackpackCargoGlobal _x; clearItemCargoGlobal _x;} forEach [_car01,_car02]; 
 
sleep 2.5; 
 
// 1st patrol group 
_pos01a = [12857,5151,0]; 
_pos01b = [12463,4941,0]; 
_pos01c = [12572,4619,0]; 
_pos01d = [13044,4873,0]; 
 
_grp01 = grpNull; 
_grp01 = [_pos01a, east, configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad", [], [], [0.3, 0.4]] call BIS_fnc_spawnGroup; 
{_x setBehaviour "Safe"; _x setSpeedMode "Limited"; _x setFormation "Column"} forEach [_grp01]; 
if (missionNamespace getVariable "BIS_enemyEquipment" == 1) then {{_null = _x execVM "scripts\garrisons\LimitEquipment.sqf"} forEach (units _grp01)}; 
{_x setSkill ["AimingAccuracy",0.15]} forEach (units _grp01); 
_grp01 enableDynamicSimulation true; 
 
_wp01a = _grp01 addWaypoint [_pos01a, 0]; 
_wp01b = _grp01 addWaypoint [_pos01b, 0]; 
_wp01c = _grp01 addWaypoint [_pos01c, 0]; 
_wp01d = _grp01 addWaypoint [_pos01d, 0]; 
_wp01e = _grp01 addWaypoint [_pos01a, 0]; 
_wp01e setWaypointType "Cycle"; 
 
 // Remove backpack with spare NLAWs 
 // {if (typeOf _x == "B_Soldier_LAT_F") then {removeBackpackGlobal _x}} forEach (units _grp01); 
 
sleep 2.5; 
 
// 2nd patrol team 
_pos02a = [13058,5298,0]; 
_pos02b = [12463,4941,0]; 
_pos02c = [12572,4619,0]; 
 
_grp02 = grpNull; 
_grp02 = [_pos02a, east, configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad_Weapons", [], [], [0.3, 0.4]] call BIS_fnc_spawnGroup; 
{_x setBehaviour "Safe"; _x setSpeedMode "Limited"; _x setFormation "Column"} forEach [_grp02]; 
if (missionNamespace getVariable "BIS_enemyEquipment" == 1) then {{_null = _x execVM "scripts\garrisons\LimitEquipment.sqf"} forEach (units _grp02)}; 
{_x setSkill ["AimingAccuracy",0.15]} forEach (units _grp02); 
_grp02 enableDynamicSimulation true; 
 
_wp02a = _grp02 addWaypoint [_pos02a, 0]; 
_wp02b = _grp02 addWaypoint [_pos02b, 0]; 
_wp02c = _grp02 addWaypoint [_pos02c, 0]; 
_wp02d = _grp02 addWaypoint [_pos02a, 0]; 
_wp02d setWaypointType "Cycle";

	// Remove backpack with spare NLAWs
	// {if (typeOf _x == "B_Soldier_LAT_F") then {removeBackpackGlobal _x}} forEach (units _grp02);
