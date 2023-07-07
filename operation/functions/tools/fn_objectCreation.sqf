params ["_obj"];
// Set Default Object cleanup times. GC is crap.
switch (true) do
{
	case (!isPlayer _obj && {_obj isKindOf "Man"}): {
		_obj addEventHandler ["Killed",{(_this select 0) spawn {sleep 120; deleteVehicle _this}}]; // If Vehicle Destroyed cleanup
	};
	case (isPlayer _obj && {_obj isKindOf "Man"}): {};
	case (_obj isKindOf "Car") : {
		_obj addEventHandler ["Killed",{(_this select 0) spawn {sleep 180; deleteVehicle _this}}]; // If Vehicle Destroyed cleanup
		{
			_x addEventHandler ["Killed",{(_this select 0) spawn {sleep 120; deleteVehicle _this}}];
		} foreach crew _obj;
	};
	case (_obj isKindOf "Tank") : {
		_obj addEventHandler ["Killed",{(_this select 0) spawn {sleep 300; deleteVehicle _this}}]; // If Vehicle Destroyed cleanup
		{
			_x addEventHandler ["Killed",{(_this select 0) spawn {sleep 120; deleteVehicle _this}}];
		} foreach crew _obj;
	};
	case (_obj isKindOf "Motorcycle") : {systemchat "Motorcycle"};
	case (_obj isKindOf "Ship") : {
		_obj addEventHandler ["Killed",{(_this select 0) spawn {sleep 60; deleteVehicle _this}}]; // If Vehicle Destroyed cleanup
		{
			_x addEventHandler ["Killed",{(_this select 0) spawn {sleep 120; deleteVehicle _this}}];
		} foreach crew _obj;
	};
	case (_obj isKindOf "Helicopter") : {
		_obj addEventHandler ["Killed",{(_this select 0) spawn {sleep 180; deleteVehicle _this}}]; // If Vehicle Destroyed cleanup
		{
			_x addEventHandler ["Killed",{(_this select 0) spawn {sleep 120; deleteVehicle _this}}];
		} foreach crew _obj;
	};
	case (_obj isKindOf "StaticWeapon") : {systemchat "Static Weapon"};
	case (_obj isKindOf "Plane") : {
		_obj addEventHandler ["Killed",{(_this select 0) spawn {sleep 120; deleteVehicle _this}}]; // If Vehicle Destroyed cleanup
		{
			_x addEventHandler ["Killed",{(_this select 0) spawn {sleep 120; deleteVehicle _this}}];
		} foreach crew _obj;
	};
	case (_obj isKindOf "Building") : {systemchat "Building"};
	case (_obj isKindOf "Wreck") : {
		_obj addEventHandler ["Killed",{(_this select 0) spawn {sleep 60; deleteVehicle _this}}]; // If Vehicle Destroyed cleanup
	};
	case (_obj isKindOf "ReammoBox_F") : {
		_obj addEventHandler ["Killed",{(_this select 0) spawn {sleep 60; deleteVehicle _this}}]; // If Vehicle Destroyed cleanup
	};
	case (_obj isKindOf "MineGeneric") : {systemchat "A Mine"};
	default {
		_obj addEventHandler ["Killed",{(_this select 0) spawn {sleep 300; deleteVehicle _this}}]; // If Vehicle Destroyed cleanup
	};
};
