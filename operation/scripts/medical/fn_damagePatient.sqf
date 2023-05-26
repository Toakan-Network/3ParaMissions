/*
 *	Author: PDT
 *	damages a patient
 *
 *	Arguments:
 *  0: _patient    <OBJECT> - patient to damge
 *  1: _difficulty <NUMBER> - difficulty of the patient.
 *
 *	Return Value:
 *	None
 *
 */

params [["_patient", objNull], ["_difficulty", 0]];

if (isNull _patient) exitWith {};

  private _bodyPartsArray =
  [
  	"head", "body", "hand_l", "hand_r", "leg_l", "leg_r" //All the body parts that can be damaged.
  ];

  private _woundTypeArray =
  [
  	"explosive", "vehiclecrash", "collision", "grenade", "shell", "bullet", "backblast", "bite"
  ];

private _injuryList = [];

switch (_difficulty) do
{
  case 0:
  {
  	private _damage = .75;
  	for "_i" from 1 to 3 do
  	{
  		private _bodyPart = selectRandom _bodyPartsArray;
  		private _woundType = selectRandom _woundTypeArray;
  		[_patient, _damage, _bodyPart, _woundType] call ace_medical_fnc_addDamageToUnit;
  	};
  };

  case 1:
  {
  	private _damage = .9;
  	for "_i" from 1 to 4 do
  	{
  		private _bodyPart = selectRandom _bodyPartsArray;
  		private _woundType = selectRandom _woundTypeArray;
  		[_patient, _damage, _bodyPart, _woundType] call ace_medical_fnc_addDamageToUnit;
  	};
  };
  case 2:
  {
  	private _damage = 1.1;
  	for "_i" from 1 to 7 do
  	{
  		private _bodyPart = selectRandom _bodyPartsArray;
		if(_bodypart in _injuryList) exitwith {_injuryList append _bodypart};

  		private _woundType = selectRandom _woundTypeArray;
  		[_patient, _damage, _bodyPart, _woundType] call ace_medical_fnc_addDamageToUnit;
  	};
  };
};
