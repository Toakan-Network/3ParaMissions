/*
Populate small base in Southend
*/
private _priorrun = missionnamespace getvariable ["SouthendAttack", 0];
private _townLoc = [12746,5067,0];

private _nearby = nearestobjects [_townLoc,["Man"],1000];
{
	if ((side _x == west) || (side _x == independent)) then {
		_nearby = _nearby - [_x];
	};
} foreach _nearby;

switch (true) do {

	case (_priorrun isEqualTo  0): {
		missionNamespace setVariable ["SouthendAttack", 1];
		// Build the Warning marker.
		// add marker on AO/target
		_marker = createMarker ["SouthendAttack", _townLoc];
		_marker setmarkershape "ELLIPSE";
		_marker setMarkerColor "ColorRed";
		_marker setMarkerText " Grozovia Assault";
		_marker setMarkerSize [1000,1000];
		_marker setMarkerAlpha .5;
		_marker setmarkerbrush "DiagGrid";
	};

	case (_priorrun isEqualTo  1 || count _nearby isEqualTo 0): {
		diag_log format ["Mission param : %1",_nearby select 0];
		missionNamespace setVariable ["SouthendAttack", 0];
		deleteMarker "SouthendAttack";
	};
};

private _priorrun = missionnamespace getvariable ["SouthendAttack", 0];
switch (true) do {

	case (_priorrun isEqualTo  1): {
		// Enemy Vehicle list.
		private _EVOptions = ["UK3CB_GAF_O_BTR70", "UK3CB_GAF_O_BMD1", "UK3CB_GAF_O_MTLB_Cannon", "UK3CB_GAF_O_Offroad_HMG"];

		// Empty vehicles
		_car01 = selectrandom _EVOptions createVehicle [12473,4950,0]; 
		_car01 setDir 260; 
		_car01 setFuel 0.25; 
		_car01 setPosATL [12473,4950,0]; 
		_car01 enableDynamicSimulation true; 
		createVehicleCrew _car01;
		
		_car02 = selectrandom _EVOptions createVehicle [13058,5298,0]; 
		_car02 setDir 180; 
		_car02 setFuel 0.25; 
		_car02 setPosATL [13058,5298,0]; 
		_car02 enableDynamicSimulation true;
		createVehicleCrew _car02; 

		_car03 = selectrandom _EVOptions createVehicle [13038,4861,0];
		_car03 setDir 0; 
		_car03 setFuel 0.25; 
		_car03 setPosATL [13038,4861,0]; 
		_car03 enableDynamicSimulation true;
		createVehicleCrew _car03; 
		
		{clearMagazineCargoGlobal _x; clearWeaponCargoGlobal _x; clearBackpackCargoGlobal _x; clearItemCargoGlobal _x;} forEach [_car01,_car02,_car03]; 
		
		// 1st patrol group 
		_pos01a = [12857,5151,0]; 
		_pos01b = [12463,4941,0]; 
		_pos01c = [12572,4619,0]; 
		_pos01d = [13044,4873,0]; 
		
		_grp01 = grpNull; 
		_grp01 = [_pos01a, east, configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad", [], [], [0.3, 0.4]] call BIS_fnc_spawnGroup; 
		{_x setBehaviour "Safe"; _x setSpeedMode "Limited"; _x setFormation "Column"} forEach [_grp01]; 
		//if (missionNamespace getVariable "BIS_enemyEquipment" == 1) then {{_null = _x execVM "scripts\garrisons\LimitEquipment.sqf"} forEach (units _grp01)}; 
		{_x setSkill ["AimingAccuracy",0.15]} forEach (units _grp01); 
		_grp01 enableDynamicSimulation true; 
		
		_wp01a = _grp01 addWaypoint [_pos01a, 0]; 
		_wp01b = _grp01 addWaypoint [_pos01b, 0]; 
		_wp01c = _grp01 addWaypoint [_pos01c, 0]; 
		_wp01d = _grp01 addWaypoint [_pos01d, 0]; 
		_wp01e = _grp01 addWaypoint [_pos01a, 0]; 
		_wp01e setWaypointType "Cycle"; 
		

		// 2nd patrol team 
		_pos02a = [13058,5298,0]; 
		_pos02b = [12463,4941,0]; 
		_pos02c = [12572,4619,0]; 
		
		_grp02 = grpNull; 
		_grp02 = [_pos02a, east, configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad", [], [], [0.3, 0.4]] call BIS_fnc_spawnGroup; 
		{_x setBehaviour "Safe"; _x setSpeedMode "Limited"; _x setFormation "Column"} forEach [_grp02]; 
		//if (missionNamespace getVariable "BIS_enemyEquipment" == 1) then {{_null = _x execVM "scripts\garrisons\LimitEquipment.sqf"} forEach (units _grp02)}; 
		{_x setSkill ["AimingAccuracy",0.15]} forEach (units _grp02); 
		_grp02 enableDynamicSimulation true; 
		
		_wp02a = _grp02 addWaypoint [_pos02a, 0]; 
		_wp02b = _grp02 addWaypoint [_pos02b, 0]; 
		_wp02c = _grp02 addWaypoint [_pos02c, 0]; 
		_wp02d = _grp02 addWaypoint [_pos02a, 0]; 
		_wp02d setWaypointType "Cycle";


		// 3rd Patrol group
		_pos03a = [13042,4872,0]; 
		_pos03b = [12904,5056,0]; 
		_pos03c = [12735,4822,0]; 
		
		_grp03 = grpNull; 
		_grp03 = [_pos03a, east, configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad_Weapons", [], [], [0.3, 0.4]] call BIS_fnc_spawnGroup; 
		{_x setBehaviour "Safe"; _x setSpeedMode "Limited"; _x setFormation "Column"} forEach [_grp03]; 
		{_x setSkill ["AimingAccuracy",0.15]} forEach (units _grp03); 
		_grp03 enableDynamicSimulation true; 
		
		_wp03a = _grp03 addWaypoint [_pos03a, 0]; 
		_wp03b = _grp03 addWaypoint [_pos03b, 0]; 
		_wp03c = _grp03 addWaypoint [_pos03c, 0]; 
		_wp03c setWaypointType "Cycle";


	};

};



