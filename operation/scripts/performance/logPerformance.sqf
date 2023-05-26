private _scriptname = "Performance";
private _countGroups = 0;  
private _allPlayers = count(call BIS_fnc_listPlayers); 
private _countWest = 0;
private _countEnemy = 0; 
private _countCiv = 0;  
 
{ 
 _countGroups = _countGroups + 1; 
 switch(side _x) do { 
  case west:
    {
    _countWest = _countWest +1;
    };
  case east: 
   { 
    _countEnemy = _countEnemy + 1; 
   }; 
  case civilian: 
   { 
    _countCiv = _countCiv + 1; 
   }; 
 }; 
} forEach allGroups; 
 
private _message = format ["ServerFPS: %1, DeadUnits: %2, AllUnits:%3, AllObjects: %4, Players:%5, Friendly:%6, Enemy:%7, Civ:%8, Groups:%9, Total:%10" 
    ,diag_fps 
    ,(count alldead) 
    ,count allunits 
    ,count allMissionObjects "all" 
    ,_allPlayers 
	,_countWest
    ,_countEnemy 
    ,_countCiv 
    ,_countGroups  
    , _allPlayers]; 

[2,_message] execvm "scripts\performance\log.sqf";