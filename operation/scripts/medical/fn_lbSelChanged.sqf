// import stuff
#define GETCFGVALUE(VAR) [missionConfigFile >> "PDT_CfgSimulator" >> VAR] call BIS_fnc_getCfgData



/*
 *	Author: PDT
 *	handles what happens when a listbox selection is changed
 *
 *	Arguments:
 *  None
 *
 *	Return Value:
 *	None
 *
 */

params ["_control", "_selectedIndex"];

// selected stretcher
private _stretcher = (_control lbData (lbCurSel _control));

// update the buttons
[_stretcher] call PDT_MedicalSimulator_fnc_updateButtons;
