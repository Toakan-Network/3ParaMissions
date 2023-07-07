// Deploy camo

params ["_vehicle"];
// Setup Camonets 
if (!(_vehicle isKindOf "Car")) exitwith {hint "Vehicle type not supported."};
if (!(_vehicle getVariable ["CamoNetSetup", false])) then {
	_vehicle setVariable ["CamoNetSetup", true];
	_vehicle addaction ["Deploy CamoNet", {
			_vehicle = _this select 0;
			if (_vehicle getVariable["CamoNetDeployed", 0] isEqualTo 0) then {
				private _playpos = getpos _vehicle;
				private _safepos = [_playpos,10,40,15] call bis_fnc_findsafepos;
				private _camNetType = '';
				switch (true) do {
					case (typeof _vehicle ==  "UK3CB_BAF_MAN_HX60_Cargo_Green_A"): {
						_camNetType = 'CamoNet_BLUFOR_big_F';
					};
					case (typeof _vehicle == "UK3CB_BAF_LandRover_Hard_FFR_Green_A"): {
						_camNetType = 'CamoNet_BLUFOR_Curator_F';
					};
					default {
						_camNetType = 'CamoNet_BLUFOR_Curator_F';
					};
				};

				_camoNet = createvehicle [_camNetType, _safepos];
				_camoNet setVariable["VehicleParent", _vehicle];
				_vehicle setVariable ["CamoNetObj", _camoNet];

				_camoNet addEventHandler ["init", {
					(_this select 0) spawn {
						private _vehicle = _this getVariable["Vehicleparent", objNull];
						while {alive _this} do {
							if ({_x distance _this > 200} count allPlayers > 0) then {
								deleteVehicle _this;
								_vehicle setVariable ["CamoNetDeployed", 0];
							};
							sleep 60;
						};
					};
				}];
				_camoNet addEventHandler ["Killed",{
					(_this select 0) spawn {
						sleep 60; 
						private _vehicle = _this getVariable["Vehicleparent", objNull];
						deleteVehicle _this;
						_vehicle setVariable ["CamoNetDeployed", 0];
						};
					}]; // If Vehicle Destroyed cleanup
				_vehicle setVariable ["CamoNetDeployed", 1];
			} else {
				hint "CamoNet Already deployed."; 
			};	
		}];
	_vehicle addaction ["Remove CamoNet", {
			private _vehicle = _this select 0;
			if (_vehicle getVariable ["CamoNetDeployed", 1] isEqualTo 1) then {
				deleteVehicle (_vehicle getvariable["CamoNetObj", objNull]);
				_vehicle setVariable ["CamoNetDeployed", 0];
			} else {
				hint "CamoNet not Deployed.";
			};
		}
	]; 
};


