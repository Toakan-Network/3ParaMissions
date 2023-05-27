// Dynamic marker generation, requires input of locations from map coords.
// Created by Tad.
// To add a new marker, setup the variable with the following example.
// 
// private _markername = ["marker_name",[_markerlocationarray],"ICON",[0,0],"PERSIST"];
//
// The marker then gets the location array based on the map, through set action.
// _markername set [2, [0,0]]; 
// With the second portion being the location array of the marker.

// Setup markers list for map, some maps can have additional markers, dependant on map and requirement.
private _markers = [];
private _map = worldName;

// Marker list
private _arsenal_land_0 = ["arsenal_land_0",[],"ICON",[0,0],"PERSIST"]; // default training box
private _arsenal_land_1 = ["arsenal_land_1",[],"ICON",[0,0],"PERSIST"]; // default hq box
private _arsenal_land_2 = ["arsenal_land_2",[],"ICON",[0,0],"PERSIST"]; // 1 section
private _arsenal_land_3 = ["arsenal_land_3",[],"ICON",[0,0],"PERSIST"]; // 2 section
private _arsenal_land_4 = ["arsenal_land_4",[],"ICON",[0,0],"PERSIST"]; // 3 section
private _arsenal_land_5 = ["arsenal_land_5",[],"ICON",[0,0],"PERSIST"]; // FSG

private _arsenal_air_0 = []; // Aviation box 1

private _airframe_0 = []; // Wildcat 
private _airframe_1 = []; // Chinnook
private _airframe_2 = []; // Puma
private _airframe_3 = []; // Apache
private _airframe_4 = []; // Jet Variant 1
private _airframe_5 = []; // Jet Variant 2

private _land_vehic_0 = []; // Foxhound
private _land_vehic_1 = []; // WMIK
private _land_vehic_2 = []; // Landy
private _land_vehic_3 = []; // Ambo
private _land_vehic_4 = []; // Quadbike
private _land_vehic_5 = []; // Challenger 2
private _land_vehic_6 = []; // FSG Flavour thing

// Dependant on map, setup the markers
switch (_map) do
{
	case "rof_mok": {
        _arsenal_land_0 set [2, [0,0]]; //
        _arsenal_land_1 set [2, [0,0]]; //
        _arsenal_land_2 set [2, [0,0]]; //
        _arsenal_land_3 set [2, [0,0]]; //
        _arsenal_land_4 set [2, [0,0]]; //
        _arsenal_land_5 set [2, [0,0]]; //
        _arsenal_air_0 set [2, [0,0]]; //
        _airframe_0 set [2, [0,0]]; //
        _airframe_1 set [2, [0,0]]; //
        _airframe_2 set [2, [0,0]]; //
        _airframe_3 set [2, [0,0]]; //
        _airframe_4 set [2, [0,0]]; //
        _airframe_5 set [2, [0,0]]; //
        _land_vehic_0 set [2, [0,0]]; //
        _land_vehic_1 set [2, [0,0]]; //
        _land_vehic_2 set [2, [0,0]]; //
        _land_vehic_3 set [2, [0,0]]; //
        _land_vehic_4 set [2, [0,0]]; //
        _land_vehic_5 set [2, [0,0]]; //
        _land_vehic_6 set [2, [0,0]]; //
	};

	case "Napf":{
		
	};

	default {
        // Default location is 0,0, or the corner of the map.
        _arsenal_land_0 set [2, [0,0]]; //
        _arsenal_land_1 set [2, [0,0]]; //
        _arsenal_land_2 set [2, [0,0]]; //
        _arsenal_land_3 set [2, [0,0]]; //
        _arsenal_land_4 set [2, [0,0]]; //
        _arsenal_land_5 set [2, [0,0]]; //
        _arsenal_air_0 set [2, [0,0]]; //
        _airframe_0 set [2, [0,0]]; //
        _airframe_1 set [2, [0,0]]; //
        _airframe_2 set [2, [0,0]]; //
        _airframe_3 set [2, [0,0]]; //
        _airframe_4 set [2, [0,0]]; //
        _airframe_5 set [2, [0,0]]; //
        _land_vehic_0 set [2, [0,0]]; //
        _land_vehic_1 set [2, [0,0]]; //
        _land_vehic_2 set [2, [0,0]]; //
        _land_vehic_3 set [2, [0,0]]; //
        _land_vehic_4 set [2, [0,0]]; //
        _land_vehic_5 set [2, [0,0]]; //
        _land_vehic_6 set [2, [0,0]]; //
    };
};

// Build Marker array.
_markers pushback _arsenal_land_0;

// Populate map with markers.
{
    _x call CBA_fnc_createMarker;
} foreach _markers;