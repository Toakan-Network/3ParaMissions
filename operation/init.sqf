// Headless Client Stuff.
if (!isDedicated && !hasInterface && isMultiplayer) then { 

};

// Dedicated Server stuff.
if (isDedicated) then {

	if (worldname isEqualTo "rof_mok") then {
	// Training server stuff only.
	enableSaving [false, false];

	// initialise common variable for rifle range script
	[] spawn RR_fnc_initCommon;

	// initialise each preplaced rifle range in the mission
	// [<RangeID>,<DrillTypes>,<NumberOfLanes>,<NumberOfDigits>,<DisplayName>,<Description>,<RangeImage>,<Marker>,<MarkerPos>,<MarkerType>,<MarkerColour>] spawn RR_fnc_initRifleRange
	["ETR2",["LMG","ETR"],8,3,"ACMT Range","An 8 lane electric target range (ETR) with targets placed at 100, 200, 300 and 400 meters. Three firing positions per lane are placed at 50, 100 and 200 meters distance from the first row of targets. Each set of targets consists of figure 11s standing three abreast that can be operated independently or as one. This range is suitable for a wide array of weapon systems and drills including light machineguns, medium machineguns, assault rifles and marksman rifles.",nil,true,getMarkerPos "ETR_Marker_0"] spawn RR_fnc_initRifleRange;
	};
	
	call "scripts\init\acre.sqf";
};

[2, "init.sqf complete."] execvm "scripts\performance\log.sqf";