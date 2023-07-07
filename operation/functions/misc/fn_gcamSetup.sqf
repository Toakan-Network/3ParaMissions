params ["_player"];
private _filename = "fn_gcamSetup";
private _startGcam =[];
if ((getplayerUID _player in GCam_Users) || (getplayerUID _player in ServerAdmins)) then {   
	[3, format ["%1 is J9 Media, giving access to GCam.", name _player], _filename] call tcz_fnc_log;   
	_startGcam = ["gcam", "GCam", "", {execVM "scripts\gcam\gcam.sqf"}, {true}] call ace_interact_menu_fnc_createAction;   
	[(typeOf _player), 1, ["ACE_SelfActions"], _startGcam] call ace_interact_menu_fnc_addActionToClass;   
};   