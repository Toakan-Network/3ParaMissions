// import stuff
#define GETCFGVALUE(VAR) [missionConfigFile >> "PDT_CfgSimulator" >> VAR] call BIS_fnc_getCfgData


/*
 *	Author: PDT
 *	clears all patients
 *
 *	Arguments:
 *  None
 *
 *	Return Value:
 *	None
 *
 */

private _stretchers = GETCFGVALUE("stretchers");

{;
  [_x select 1] call PDT_MedicalSimulator_fnc_clearStretcher;
} forEach _stretchers;
