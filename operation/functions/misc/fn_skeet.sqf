private ["_machine"];
_machine = _this select 0;

if (!(isnil "_machine")) then {	
	private ["_disc", "_discPos"];
	_discPos = [_machine, 0.6, 180] call BIS_fnc_relPos;
	_disc = "Skeet_Clay_F" createVehicle [(_discPos select 0), (_discPos select 1), 0.7];
	_disc setPos [(_discPos select 0), (_discPos select 1), 0.7];
	playSound "sound2";

	private ["_vel", "_ehCode"];
	_vel = [[0, -1, 0], (direction _machine + random 4 - random 4)] call BIS_fnc_rotateVector2D;
	_disc setVelocity [(-(_vel select 0) * 9), ((_vel select 1) * 9), 10 + (random 2)];
	_disc enableDynamicSimulation true; 
	
	_ehCode = 
	{
		private ["_disc", "_killer"];
		_disc = _this select 0;
		_killer = _this select 1;

		//Only score a hit while the skeet is airborne.
		if (((position _disc) select 0) > 0.1) then 
		{
			if ((_disc distance _killer) <= 1000) then 
			{
				playSound "sound1";
			};
		};
		deleteVehicle _disc;		
	};
	_disc addEventHandler ["killed", _ehCode];

	[_disc] spawn {
		_disc = _this select 0;
		sleep 30;
		if (alive _disc) then { 
			deleteVehicle _disc
		};
	}; // Delete after 60 seconds.	

	sleep 1;
	//Make sure the skeet flies a bit longer than normal physics would cause.
	_vel = velocity _disc;
	
	private ["_i"];
	_i = 0;
	
	while {(((position _disc) select 2) > 0.1) && (alive _disc)} do 
	{
		_disc setVelocity [(_vel select 0) / (1 + (_i / 10)), (_vel select 1) / (1 + (_i / 10)), (_vel select 2) / (1 + _i)];
		_i = _i + 0.1;
		sleep 0.1;
	};	
};
true