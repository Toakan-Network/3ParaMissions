/*
Dynamic Population script. Takes Marker names and sets difficulty based on operation.
Written by Tad. Find me on Steam: 76561197991835568 

Accepted Markers:
ao_marker_southend
ao_marker_campbeltown
ao_marker_fiwaf
ao_marker_fibua
ao_marker_hq

Usage:
[null, player, null, ["Markername", 3, "Objective Name"]] execvm "scripts\garrisons\objectives\populate.sqf"
*/

params ["_target", "_caller", "_actionId", "_arguments"];
private _objName = '';
_markername = _this select 3 select 0;
_difficulty = _this select 3 select 1;
[2,format ["Spawning AO: %1", _markername]] call tcz_fnc_log; 
if (count (_this select 3) > 2) then{
	private _objName = _this select 3 select 2;
	[2,format ["Objective: %1", _objName]] call tcz_fnc_log; 
} ;

[2,format ["Spawning AO: %1", _markername]] call tcz_fnc_log; 

private _priorrun = missionnamespace getvariable ["AOOnline", 0];
private _townLoc = getMarkerPos _markername;
private _difficultyModifier = 0;

// Sanity Check, is AO already running?
if (_priorrun isEqualTo 1) exitwith {
	[1, format ["Area of Operations already declared."]] call tcz_fnc_log;
};

if (_townloc isEqualTo []) exitwith {
	[1, format ["Error trying to determine town location"]] call tcz_fnc_log;
};

private _markerX = 0;
private _markerY = 0;
private _taskID = '';
private _taskTitle = '';
private _taskDesc = '';

// Build the Warning marker and add marker on AO/target
switch (_markername) do {
	case ("ao_marker_southend"): {
		missionNamespace setVariable ["AOOnline", 1];
		missionNamespace setVariable [_markername, 1];
		_markerX = 1000;
		_markerY = 1000;
		_taskID = 'AO_Southend';
		_taskTitle = 'Capture Southend';
		_taskDesc = 'Southend has been overrun, take it back!';
		_difficultyModifier = 1;

	};

	case ("ao_marker_campbeltown"): {
		missionNamespace setVariable ["AOOnline", 1];
		missionNamespace setVariable [_markername, 1];
		_markerX = 1000;
		_markerY = 1000;
		_taskID = 'AO_Campbeltown';
		_taskTitle = 'Capture Campbeltown';
		_taskDesc = 'Campbeltown has been infiltrated, flush out the enemy and clear the surrounding area!';
		_difficultyModifier = 2;

	};

	case ("ao_marker_fibua"): {
		missionNamespace setVariable ["AOOnline", 1];
		missionNamespace setVariable [_markername, 1];
		_markerX = 250;
		_markerY = 250;
		_taskID = 'AO_Fibua';
		_taskTitle = 'FIBUA Training';
		_taskDesc = '';
		_difficultyModifier = .5;
	};

	case ("ao_marker_fiwaf"): { 
		missionNamespace setVariable ["AOOnline", 1];
		missionNamespace setVariable [_markername, 1];
		_markerX = 1000;
		_markerY = 1000;
		_taskID = 'AO_fiwaf';
		_taskTitle = 'FIWAF Training';
		_taskDesc = '';
		_difficultyModifier = 1.5;
	};

	case ("ao_marker_hq"): {
		missionNamespace setVariable ["AOOnline", 1];
		missionNamespace setVariable [_markername, 1];
		_markerX = 800;
		_markerY = 800;
		_taskID = 'AO_HQ_Defence';
		_taskTitle = 'ITC HQ Defence';
		_taskDesc = '';
		_difficultyModifier = 1;
	};

	default { // ao_marker_hq
		missionNamespace setVariable ["AOOnline", 1];
		missionNamespace setVariable [_markername, 1];
		_markerX = 800;
		_markerY = 800;
		_taskID = 'AO_Defence';
		_taskTitle = _objName;
		_taskDesc = '';
		_difficultyModifier = 1;
	};
};
_marker = createMarker ["AO", _townLoc];
_marker setMarkerSize [_markerX,_markerY];
_marker setmarkershape "ELLIPSE";
_marker setMarkerColor "ColorRed";
_marker setMarkerAlpha .5;
_marker setmarkerbrush "DiagGrid";

// Create a Task for the objective
[_taskID, true, [_taskDesc,_taskTitle, _marker],_townLoc,"AUTOASSIGNED",5,true, true] call BIS_fnc_setTask;

// Setup Spawn amounts
private _playerCount = playersNumber west;
private _eSections = 0;
private _eTechnicals = 0;
private _earmour = 0;
private _eAAMobile = 0;
private _eAAStatic = 0;
private _eAirAsset = 0;
private _eSFAssets = 0;

switch (true) do {
	case (_playerCount > 3 AND _playerCount <9): {
		_eSections = 4;
		_eTechnicals = 2;
		_earmour = 1;
		_eAirAsset = 1;
	};

	case (_playerCount > 7 AND _playerCount <17): {
		_eSections = 6;
		_eTechnicals = 4;
		_earmour = 2;
		_eAAMobile = 1;
		_eAAStatic = 1;
		_eAirAsset = 2;
	};

	case (_playerCount > 16): {
		_eSections = 8;
		_eTechnicals = 6;
		_earmour = 3;
		_eAirAsset = 2;
		_eAAMobile = 2;
		_eAAStatic = 1;
		_eSFAssets = 2
	};

	default {
		_eSections = 2;
		_eTechnicals = 1;
	};
};

// Required params for use in a moment
private _priorrun = missionnamespace getvariable ["AOOnline", 0];
private _spawnedUnits = [];
private _garrisonAO = ["ao_marker_southend", "ao_marker_campbeltown", "ao_marker_fibua"];
private _maxRange = round((_markerx + _markery)*.3); 

// Custom Section Groups
private _esectionNormal =["UK3CB_GAF_O_SL","UK3CB_GAF_O_TL","UK3CB_GAF_O_MD","UK3CB_GAF_O_RIF_1","UK3CB_GAF_O_LAT","UK3CB_GAF_O_RIF_1","UK3CB_GAF_O_ENG","UK3CB_GAF_O_DEM"];
private _esectionGuns =["UK3CB_GAF_O_SL","UK3CB_GAF_O_TL","UK3CB_GAF_O_MD","UK3CB_GAF_O_AR","UK3CB_GAF_O_RIF_1","UK3CB_GAF_O_ENG","UK3CB_GAF_O_AR","UK3CB_GAF_O_RIF_1"];
private _esectionAA =["UK3CB_GAF_O_SL","UK3CB_GAF_O_TL","UK3CB_GAF_O_MD","UK3CB_GAF_O_AA","UK3CB_GAF_O_AA_ASST","UK3CB_GAF_O_RIF_2","UK3CB_GAF_O_AR","UK3CB_GAF_O_RIF_1"];
private _esectionAT =["UK3CB_GAF_O_SL","UK3CB_GAF_O_TL","UK3CB_GAF_O_MD","UK3CB_GAF_O_AT","UK3CB_GAF_O_AT_ASST","UK3CB_GAF_O_RIF_1","UK3CB_GAF_O_AR","UK3CB_GAF_O_RIF_1"];
private _eSFSniper = ["UK3CB_GAF_O_SF_SNI","UK3CB_GAF_O_SF_SPOT"];
private _eSFRecce = ["UK3CB_GAF_O_SF_TL","UK3CB_GAF_O_SF_MK","UK3CB_GAF_O_SF_MD","UK3CB_GAF_O_SF_LAT"];

// Enemy Vehicle list.
private _eTechnicalOptions = ["UK3CB_GAF_O_BTR70", "UK3CB_GAF_O_BMD1","UK3CB_GAF_O_Offroad_HMG"];
private _eArmourOptions = ["UK3CB_GAF_O_MTLB_Cannon","UK3CB_GAF_O_BTR80a","UK3CB_GAF_O_BTR80","UK3CB_GAF_O_MTLB_Cannon","UK3CB_GAF_O_BRM1K","UK3CB_GAF_O_BMP2K","UK3CB_GAF_O_BMP2","UK3CB_GAF_O_T72A"];
private _eSectionOptions = [_esectionNormal, _esectionGuns, _esectionAA, _esectionAT];
private _eSFOptions = [_eSFSniper, _eSFRecce];
private _eAAMobileOptions = ["UK3CB_GAR_O_Gaz66_ZU23", "UK3CB_GAR_O_Ural_ZU23"];
private _eAAStaticOptions = ["UK3CB_GAF_O_ZsuTank", "UK3CB_GAF_O_ZsuTank", "UK3CB_GAF_O_ZsuTank", "UK3CB_GAF_O_2S6M_Tunguska"];
private _eAirOptions = ["UK3CB_GAF_O_Mi_24V", "UK3CB_GAF_O_Mi_24V", "UK3CB_GAF_O_Mi8AMTSh", "UK3CB_GAF_O_Mi8AMTSh", "UK3CB_GAF_O_MIG21_CAS"];

switch (true) do {

	case (_priorrun isEqualTo 1): {
		// Section spawn
		for "_i" from 1 to round(_eSections * _difficultymodifier * _difficulty) do {
			private _unitpos = [_townLoc, 200, _maxRange, 0, 0, 0.1, 0] call BIS_fnc_findSafePos;
			_grp = [_unitpos, east, selectrandom _eSectionOptions, [], [], [0.3, 0.4]] call BIS_fnc_spawnGroup; 
			_grp setBehaviourStrong "COMBAT";
			if (_markername in _garrisonAO) then {
				diag_log "Infantry are defending";
				[_grp, _townloc, _markerX/3, 3, 0.2, 0.4] call CBA_fnc_taskDefend;
			} else {
				[_grp, _townLoc, 800] call BIS_fnc_taskPatrol;
			};
			
			_grp enableDynamicSimulation true; 
			{
				_x setSkill ["AimingAccuracy", round(0.15 * (_playerCount / 100))];
				_x addEventHandler ["Killed",{(_this select 0) spawn {sleep 120; deleteVehicle _this}}];
			} foreach units _grp;

			_spawnedUnits pushback _grp;
		};

		// Vehicle spawn
		for "_i" from 1 to round(_eTechnicals * _difficultymodifier * _difficulty) do {
			private _vehPos = [_townLoc, 200, _maxRange, 0, 0, 0.1, 0] call BIS_fnc_findSafePos;
			_vehicle = createVehicle [selectrandom _eTechnicalOptions, _vehPos];
			_vehicle setdir 0;
			_vehicle setFuel 0.5; 
			_vehicle enableDynamicSimulation true; 
			_spawnedUnits pushback _vehicle;
			createVehicleCrew _vehicle;
			[group (driver _vehicle), _townLoc, 500] call BIS_fnc_taskPatrol;
			{
				_spawnedUnits pushback _x;
				_x addEventHandler ["Killed",{(_this select 0) spawn {sleep 120; deleteVehicle _this}}];
			} foreach crew _vehicle;
			_vehicle addEventHandler ["Killed",{(_this select 0) spawn {sleep 300; deleteVehicle _this}}];
		};
		
		// _eArmour
		for "_i" from 1 to round(_earmour * _difficultymodifier * _difficulty) do {
			private _vehPos = [_townLoc, 5, _maxRange, 0, 0, 0.1, 0] call BIS_fnc_findSafePos;
			_vehicle = createVehicle [selectrandom _eArmourOptions, _vehPos];
			_vehicle setdir 0;
			_vehicle setFuel 0.5; 
			_vehicle enableDynamicSimulation true; 
			_spawnedUnits pushback _vehicle;
			[group (driver _vehicle), _townLoc, 200] call BIS_fnc_taskPatrol;
			createVehicleCrew _vehicle;
			{
				_spawnedUnits pushback _x;
				_x addEventHandler ["Killed",{(_this select 0) spawn {sleep 120; deleteVehicle _this}}];
			} foreach crew _vehicle;
			_vehicle addEventHandler ["Killed",{(_this select 0) spawn {sleep 300; deleteVehicle _this}}];
		};

		// _eAAMobile
		for "_i" from 1 to round(_eAAMobile * _difficultymodifier * _difficulty) do {
			private _vehPos = [_townLoc, 5, _maxRange, 0, 0, 0.1, 0] call BIS_fnc_findSafePos;
			_vehicle = createVehicle [selectrandom _eAAMobileOptions, _vehPos];
			_vehicle setdir 0;
			_vehicle setFuel 0.5; 
			_spawnedUnits pushback _vehicle;
			[group (driver _vehicle), _townLoc, 200] call BIS_fnc_taskPatrol;
			createVehicleCrew _vehicle;
			{
				_spawnedUnits pushback _x;
				_x addEventHandler ["Killed",{(_this select 0) spawn {sleep 120; deleteVehicle _this}}];
			} foreach crew _vehicle;
			_vehicle addEventHandler ["Killed",{(_this select 0) spawn {sleep 300; deleteVehicle _this}}];
		};

		// _eAAStatic
		for "_i" from 1 to round(_eAAStatic * _difficultymodifier * _difficulty) do {
			private _vehPos = [_townLoc, 5, _maxRange, 0, 0, 0.1, 0] call BIS_fnc_findSafePos;
			_vehicle = createVehicle [selectrandom _eAAStaticOptions, _vehPos];
			_vehicle setdir 0;
			_vehicle setFuel 0; 
			_spawnedUnits pushback _vehicle;
			[group (driver _vehicle), _townLoc, 200] call BIS_fnc_taskPatrol;
			createVehicleCrew _vehicle;
			{
				_spawnedUnits pushback _x;
				_x addEventHandler ["Killed",{(_this select 0) spawn {sleep 120; deleteVehicle _this}}];
			} foreach crew _vehicle;
			_vehicle addEventHandler ["Killed",{(_this select 0) spawn {sleep 300; deleteVehicle _this}}];
		};

		// _eAirAsset
		for "_i" from 1 to round(_eAirAsset * _difficultymodifier * _difficulty) do {
			private _vehPos = [_townLoc, 5, _maxRange, 0, 0, 0.1, 0] call BIS_fnc_findSafePos;
			_vehicle = createVehicle [selectrandom _eAirOptions, _vehPos, [], 0, "FLY"];
			createVehicleCrew _vehicle;
			_vehicle setFuel 1; 
			_spawnedUnits pushback _vehicle;
			[group (driver _vehicle), _townLoc, 200] call BIS_fnc_taskPatrol;
			{
				_spawnedUnits pushback _x;
				_x addEventHandler ["Killed",{(_this select 0) spawn {sleep 120; deleteVehicle _this}}];
			} foreach crew _vehicle;
			_vehicle addEventHandler ["Killed",{(_this select 0) spawn {sleep 300; deleteVehicle _this}}];
		};

		// _eSFAssets
		for "_i" from 1 to round(_eSFAssets * _difficultymodifier * _difficulty) do {
			private _unitpos = [_townLoc, 200, _maxRange, 0, 0, 0.1, 0] call BIS_fnc_findSafePos;
			_grp = [_unitpos, east, selectrandom _eSFOptions, [], [], [0.3, 0.4]] call BIS_fnc_spawnGroup; 
			_grp setBehaviourStrong "COMBAT";
			[_grp, _townLoc, 800] call BIS_fnc_taskPatrol;
			_grp enableDynamicSimulation true; 
			{
				_x setSkill ["AimingAccuracy", round(0.15 * (_playerCount / 100))];
				_x addEventHandler ["Killed",{(_this select 0) spawn {sleep 120; deleteVehicle _this}}];
			} foreach units _grp;

			_spawnedUnits pushback _grp;
		};
	};
};

// Spawn cleanup script
[_townLoc, _spawnedUnits, _marker, _markerName, _taskID] spawn {
	params ["_townLoc", "_spawnedUnits", "_marker", "_markerName", "_taskID"];
	private _isrunning = missionnamespace getvariable ["AOOnline", 0];
	waitUntil {
		sleep 10;
		private _nearby = nearestobjects [_townLoc,["Man"],1000];
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
		if (count _nearby == 0) then {
				true;
			} else {
				false;
			};
		};
	
	if (_isrunning isEqualTo 1) then {
		[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
		missionNamespace setVariable ["AOOnline", 0];
		missionNamespace setVariable [_markerName, 0];
		deleteMarker _marker;
		sleep 5;
		[_taskID] call BIS_fnc_deleteTask;
	};
}