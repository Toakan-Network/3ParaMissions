/*
Populate small base in Southend
*/
private _priorrun = missionnamespace getvariable ["SouthendAttack", 0];
private _townLoc = [12746,5067,0];

// Sanity Check, is AO already running?
if (_priorrun isEqualTo 1) exitwith {
	[2, format ["Attack on Southend Running"]] execvm "scripts\performance\log.sqf";
};


if (_priorrun isEqualTo  0) then {
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

		// Create a Task for the objective
		["C_Southend", true, ["Southend has been overrun, take it back!","Capture Southend", "SouthendAttack"],_townLoc,"AUTOASSIGNED",5,true, true] call BIS_fnc_setTask;
	} else {
		[2, format ["Unexpected Value found in SouthendAttack"]] execvm "scripts\performance\log.sqf";
	};


// Setup Spawn amounts
private _playerCount = playersNumber west;
private _eSections = 0;
private _eTechnicals = 0;
private _earmour = 0;

switch (true) do {
	case (_playerCount > 3 AND _playerCount <9): {
		_eSections = 4;
		_eTechnicals = 2;
		_earmour = 1;
	};

	case (_playerCount > 8 AND _playerCount <17): {
		_eSections = 6;
		_eTechnicals = 4;
		_earmour = 2;
	};

	case (_playerCount > 16): {
		_eSections = 8;
		_eTechnicals = 6;
		_earmour = 3;
	};

	default {
		_eSections = 2;
		_eTechnicals = 1;
		_earmour = 0;
	};
};

private _priorrun = missionnamespace getvariable ["SouthendAttack", 0];
private _spawnedUnits = [];

// Custom Section Groups
private _esectionNormal =["UK3CB_GAF_O_SL","UK3CB_GAF_O_TL","UK3CB_GAF_O_MD","UK3CB_GAF_O_RIF_1","UK3CB_GAF_O_LAT","UK3CB_GAF_O_RIF_1","UK3CB_GAF_O_ENG","UK3CB_GAF_O_DEM"];
private _esectionGuns =["UK3CB_GAF_O_SL","UK3CB_GAF_O_TL","UK3CB_GAF_O_MD","UK3CB_GAF_O_AR","UK3CB_GAF_O_RIF_1","UK3CB_GAF_O_ENG","UK3CB_GAF_O_AR","UK3CB_GAF_O_RIF_1"];
private _esectionAA =["UK3CB_GAF_O_SL","UK3CB_GAF_O_TL","UK3CB_GAF_O_MD","UK3CB_GAF_O_AA","UK3CB_GAF_O_AA_ASST","UK3CB_GAF_O_RIF_2","UK3CB_GAF_O_AR","UK3CB_GAF_O_RIF_1"];
private _esectionAT =["UK3CB_GAF_O_SL","UK3CB_GAF_O_TL","UK3CB_GAF_O_MD","UK3CB_GAF_O_AT","UK3CB_GAF_O_AT_ASST","UK3CB_GAF_O_RIF_1","UK3CB_GAF_O_AR","UK3CB_GAF_O_RIF_1"];

switch (true) do {

	case (_priorrun isEqualTo 1): {
		// Enemy Vehicle list.
		private _eTechnicalOptions = ["UK3CB_GAF_O_BTR70", "UK3CB_GAF_O_BMD1","UK3CB_GAF_O_Offroad_HMG"];
		private _eArmourOptions = ["UK3CB_GAF_O_MTLB_Cannon","UK3CB_GAF_O_BTR80a","UK3CB_GAF_O_BTR80","UK3CB_GAF_O_MTLB_Cannon","UK3CB_GAF_O_BRM1K","UK3CB_GAF_O_BMP2K","UK3CB_GAF_O_BMP2","UK3CB_GAF_O_T72A"];
		private _eSectionOptions = [_esectionNormal, _esectionGuns, _esectionAA, _esectionAT];
		// configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad"

		// Section spawn
		for "_i" from 1 to _eSections do {
			private _unitpos = [_townLoc, 100, 600, 0, 0, 0.1, 0] call BIS_fnc_findSafePos;
			_grp = [_townLoc, east, selectrandom _eSectionOptions, [], [], [0.3, 0.4]] call BIS_fnc_spawnGroup; 
			_grp setBehaviourStrong "COMBAT";
			[_grp, _townLoc, 700] call BIS_fnc_taskPatrol;
			_grp enableDynamicSimulation true; 
			{
				_x setSkill ["AimingAccuracy",0.35];
				_x addEventHandler ["Killed",{(_this select 0) spawn {sleep 30; deleteVehicle _this}}];
			} foreach units _grp;

			_spawnedUnits pushback _grp;
		};

		// Vehicle spawn
		for "_i" from 1 to _eTechnicals do {
			private _vehPos = [_townLoc, 5, 600, 0, 0, 0.1, 0] call BIS_fnc_findSafePos;
			diag_log format ["Vehicle Pos : %1", _vehPos];
			_vehicle = createVehicle [selectrandom _eTechnicalOptions, _vehPos];
			_vehicle setdir 0;
			_vehicle setFuel 0.5; 
			[group _vehicle, _townLoc, 500] call BIS_fnc_taskPatrol;
			_vehicle enableDynamicSimulation true; 
			_spawnedUnits pushback _vehicle;
			createVehicleCrew _vehicle;
			{
				_spawnedUnits pushback _x;
				_x addEventHandler ["Killed",{(_this select 0) spawn {sleep 30; deleteVehicle _this}}];
			} foreach crew _vehicle;
			_vehicle addEventHandler ["Killed",{(_this select 0) spawn {sleep 30; deleteVehicle _this}}];
		};

		for "_i" from 1 to _earmour do {
			private _vehPos = [_townLoc, 5, 600, 0, 0, 0.1, 0] call BIS_fnc_findSafePos;
			diag_log format ["Vehicle Pos : %1", _vehPos];
			_vehicle = createVehicle [selectrandom _eArmourOptions, _vehPos];
			_vehicle setdir 0;
			_vehicle setFuel 0.5; 
			[group _vehicle, _townLoc, 500] call BIS_fnc_taskPatrol;
			_vehicle enableDynamicSimulation true; 
			_spawnedUnits pushback _vehicle;
			createVehicleCrew _vehicle;
			{
				_spawnedUnits pushback _x;
				_x addEventHandler ["Killed",{(_this select 0) spawn {sleep 30; deleteVehicle _this}}];
			} foreach crew _vehicle;
			_vehicle addEventHandler ["Killed",{(_this select 0) spawn {sleep 30; deleteVehicle _this}}];
		};
		// {clearMagazineCargoGlobal _x; clearWeaponCargoGlobal _x; clearBackpackCargoGlobal _x; clearItemCargoGlobal _x;} forEach [_car01,_car02,_car03]; 
		
	};
};
diag_log format ["Unit list: %1", _spawnedUnits];
// Spawn cleanup script
[_townLoc,_spawnedUnits] spawn {
	params ["_townLoc", "_spawnedUnits"];
	private _isrunning = missionnamespace getvariable ["SouthendAttack", 0];
	diag_log format ["Unit list passed: %1", _spawnedUnits];
	waitUntil {
		sleep 10;
		private _nearby = nearestobjects [_townLoc,["Man"],1000];
		diag_log format ["Running Check on Active AO"];
		{
			// Remove Players from the checks
			if ((side _x == west) || (side _x == independent)) then {
				_nearby = _nearby - [_x];
			};
			// Are the units alive?
			if (!alive _x) then {
				_nearby = _nearby - [_x];
				_spawnedUnits = _spawnedUnits - [_x];
			};
		} foreach _nearby;
		diag_log format ["Found units: %1", _nearby];
		if (count _nearby == 0) then {
				true;
			} else {
				false;
			};
		};
	
	if (_isrunning isEqualTo 1) then {
		["C_Southend", "SUCCEEDED"] call BIS_fnc_taskSetState;
		missionNamespace setVariable ["SouthendAttack", 0];
		deleteMarker "SouthendAttack";
		diag_log format ["Unit list passed: %1", _spawnedUnits];
		sleep 5;
		["C_Southend"] call BIS_fnc_deleteTask;
	};
}