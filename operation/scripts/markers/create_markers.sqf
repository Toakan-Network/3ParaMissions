// Creates maker pushed by to this function.
params [
    "_marker"
];

private _markers = this select 0;

if (!isServer) exitWith {
    "Marker creation called on client." remoteExec ["tad_fnc_log", 2];
};

// Populate map with markers.
{
    _x call CBA_fnc_createMarker;
} foreach _markers;