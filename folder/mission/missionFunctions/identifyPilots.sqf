/*
*identifyPilots.sqf
* sets mission trigger variable to true in order for the mission to carry on, on action activation
*/
_object = (_this select 0);
_actionIndex = (_this select 2);
_grpA = ((_this select 3) select 0);
_grpB = ((_this select 3) select 1);
_flightUnits = ((_this select 3) select 2);
_countFlightUnits = count _flightUnits;

diag_log "<-------------identifyPilots.sqf-------------> fired";

if (!alive _object) exitWith {diag_log "<-------------identifyPilots.sqf-------------> unit dead";};

["Sauerkirschen!", "hint", player] call BIS_fnc_MP;

missionNamespace setVariable ["SWM_pilotsIdentified", true]; 
publicVariableServer "SWM_pilotsIdentified";

diag_log "<-------------identifyPilots.sqf-------------> variable set true";

for [{_i= 1},{(_countFlightUnits - _i)>=0},{_i = _i + 1}] do {
_selector = _countFlightUnits - _i;
[[(_flightUnits select _selector), _actionIndex], "removeAction",_grpA, true] call BIS_fnc_MP;
[[(_flightUnits select _selector), _actionIndex], "removeAction",_grpB, true] call BIS_fnc_MP;
};
diag_log "<-------------identifyPilots.sqf-------------> action removed";