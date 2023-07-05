private _placesCfg = configFile >> "CfgWorlds" >> worldName >> "Names";    
private _placesToKeep = ["NameCityCapital","NameCity","NameVillage"];    
private _places = [];  
private _AOCompleted = missionNamespace getVariable ["_AOCompleted",[]];
missionNamespace setVariable ["AOOnline", 1];

// Build list of towns.  
for "_i" from 0 to (count _placesCfg)-1 do    
{    
	_place = _placesCfg select _i;    
	_name = toUpper((_place >> "name") call BIS_fnc_getCfgData);    
	_position = (_place >> "position") call BIS_fnc_getCfgData;    
	_type = (_place >> "type") call BIS_fnc_getCfgData; 
	_radiusA = (_place >> "radiusA") call BIS_fnc_getCfgData; 
	_radiusB = (_place >> "radiusB") call BIS_fnc_getCfgData;  
	if(_type in _placesToKeep) then {    
	_places pushback [_name, _position, [_radiusA,_radiusB]];    
	};    
};   

private _AOs = [];
private _townsize = 0;

// Setup Spawn amounts
private _playerCount = playersNumber west;
private _eSections = 0;
private _eTechnicals = 0;
private _earmour = 0;
private _eAAMobile = 0;
private _eAAStatic = 0;
private _eAirAsset = 0;
private _eSFAssets = 0;

// Required params for use in a moment
private _spawnedUnits = [];
private _garrisonAO = ["ao_marker_southend", "ao_marker_campbeltown", "ao_marker_fibua"];

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


{
	_townname = _x select 0;
	_townloc = _x select 1;
	_townRADA = _x select 2 select 0;
	_townRADB = _x select 2 select 1;

	_townSize = round(((_townRADA + _townRADB)*1.3)/2);

	diag_log format ["Town: %1, Size %2", _townname, _townsize];
	// Build markers here;
	_markername = format ["AO_%1",_townname];
	deletemarker _markername;
	_marker = createMarker [_markername, _townLoc];
	_marker setMarkerSize [_townRADA, _townRADB];
	_marker setmarkershape "ELLIPSE";
	_marker setMarkerColor "ColorRed";
	_marker setMarkerAlpha .5;
	_marker setmarkerbrush "DiagGrid";

	// Set Tasking
	_taskTitle = format ["TAKE %1", _townname];
	_taskDesc = "Enemy troops have been detected, find them and destroy them!";
	[_markername, true, [_taskDesc,_taskTitle, _marker],_townLoc,"AUTOASSIGNED",5,true, true] call BIS_fnc_setTask;

	_AOs pushback _markername;
	missionNamespace setVariable [_markerName, 1];
	if (_markername in _AOCompleted) exitwith {diag_log format ["Mission Completed: %1", _markername]};

	switch (true) do {
		case (_townSize <= 100): {
			_eSections = 2;
		};

		case (_townsize <= 250): {
			_eSections = 4;
			_eTechnicals = 1;
		};

		case (_townsize <= 500): {
			_eSections = 4;
			_eTechnicals = 2;
			_earmour = 1;
			_eAAMobile = 1;
		};

		case (_townsize <= 750): {
			_eSections = 9;
			_eTechnicals = 3;
			_earmour = 1;
			_eAAMobile = 2;
			_eAirAsset = 1;
		};

		case (_townsize <= 1000): {
			_eSections = 10;
			_eTechnicals = 3;
			_earmour = 1;
			_eAAMobile = 2;
			_eAAStatic = 1;
			_eAirAsset = 2;
			_eSFAssets = 1;
		};

		case (_townsize > 1000): {
			_eSections = 10;
			_eTechnicals = 3;
			_earmour = 1;
			_eAAMobile = 2;
			_eAAStatic = 1;
			_eSFAssets = 2;
			_eAirAsset = 3;
		};

		default {
			_eSections = 2;
			_eTechnicals = 1;
			_earmour = 0;
			_eAAMobile = 0;
			_eAAStatic = 0;
			_eAirAsset = 0;
			_eSFAssets = 0;
		};
	};

	// Section spawn
	IF (_esections > 0) then {
		for "_i" from 1 to round(_eSections) do {
			private _unitpos = [_townLoc, 200, _townSize, 0, 0, 0.1, 0] call BIS_fnc_findSafePos;
			_grp = [_unitpos, east, selectrandom _eSectionOptions, [], [], [0.3, 0.4]] call BIS_fnc_spawnGroup; 
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

	// Vehicle spawn
	if (_eTechnicals > 0) then {
		for "_i" from 1 to round(_eTechnicals) do {
			private _vehPos = [_townLoc, 200, _townSize, 0, 0, 0.1, 0] call BIS_fnc_findSafePos;
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
	};

	// _eArmour
	if (_earmour > 0) then {
		for "_i" from 1 to round(_earmour) do {
			private _vehPos = [_townLoc, 5, _townSize, 0, 0, 0.1, 0] call BIS_fnc_findSafePos;
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
	};

	// _eAAMobile
	if (_eaamobile > 0) then {
		for "_i" from 1 to round(_eAAMobile) do {
			private _vehPos = [_townLoc, 5, _townSize, 0, 0, 0.1, 0] call BIS_fnc_findSafePos;
			_vehicle = createVehicle [selectrandom _eAAMobileOptions, _vehPos];
			_vehicle setdir 0;
			_vehicle setFuel 0.5; 
			_spawnedUnits pushback _vehicle;
			_vehicle enableDynamicSimulation true; 
			[group (driver _vehicle), _townLoc, 200] call BIS_fnc_taskPatrol;
			createVehicleCrew _vehicle;
			{
				_spawnedUnits pushback _x;
				_x addEventHandler ["Killed",{(_this select 0) spawn {sleep 120; deleteVehicle _this}}];
			} foreach crew _vehicle;
			_vehicle addEventHandler ["Killed",{(_this select 0) spawn {sleep 300; deleteVehicle _this}}];
		};
	};

	// _eAAStatic
	if (_eAAStatic > 0) then {
		for "_i" from 1 to round(_eAAStatic) do {
			private _vehPos = [_townLoc, 5, _townSize, 0, 0, 0.1, 0] call BIS_fnc_findSafePos;
			_vehicle = createVehicle [selectrandom _eAAStaticOptions, _vehPos];
			_vehicle setdir 0;
			_vehicle setFuel 0; 
			_spawnedUnits pushback _vehicle;
			_vehicle enableDynamicSimulation true; 
			[group (driver _vehicle), _townLoc, 200] call BIS_fnc_taskPatrol;
			createVehicleCrew _vehicle;
			{
				_spawnedUnits pushback _x;
				_x addEventHandler ["Killed",{(_this select 0) spawn {sleep 120; deleteVehicle _this}}];
			} foreach crew _vehicle;
			_vehicle addEventHandler ["Killed",{(_this select 0) spawn {sleep 300; deleteVehicle _this}}];
		};
	};

	// _eAirAsset
	if (_eAirAsset > 0) then {
		for "_i" from 1 to round(_eAirAsset) do {
			private _vehPos = [_townLoc, 5, _townSize, 0, 0, 0.1, 0] call BIS_fnc_findSafePos;
			_vehicle = createVehicle [selectrandom _eAirOptions, _vehPos, [], 0, "FLY"];
			createVehicleCrew _vehicle;
			_vehicle setFuel 1; 
			_spawnedUnits pushback _vehicle;
			_vehicle enableDynamicSimulation true; 
			[group (driver _vehicle), _townLoc, 200] call BIS_fnc_taskPatrol;
			{
				_spawnedUnits pushback _x;
				_x addEventHandler ["Killed",{(_this select 0) spawn {sleep 120; deleteVehicle _this}}];
			} foreach crew _vehicle;
			_vehicle addEventHandler ["Killed",{(_this select 0) spawn {sleep 300; deleteVehicle _this}}];
		};
	};

	// _eSFAssets
	if (_eSFAssets > 0) then {
		for "_i" from 1 to round(_eSFAssets) do {
			private _unitpos = [_townLoc, 200, _townSize, 0, 0, 0.1, 0] call BIS_fnc_findSafePos;
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

	// Spawn cleanup script
	private _AOHandler = [_townLoc, _spawnedUnits, _marker, _markerName, _markername] spawn {
		params ["_townLoc", "_spawnedUnits", "_marker", "_markerName", "_taskID"];
		private _isrunning = missionnamespace getvariable ["AOOnline", 0];
		waitUntil {
			sleep 30;
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
		
			[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
			missionNamespace setVariable ["AOOnline", 0];
			missionNamespace setVariable [_markerName, 0];
			deleteMarker _marker;
			private _completed = missionnamespace getVariable ["_AOCompleted", []];
			_completed pushback _markername;
			missionNamespace setvariable ["AOCompleted", _completed];
			sleep 5;
			[_taskID] call BIS_fnc_deleteTask;
	};

} foreach _places;

