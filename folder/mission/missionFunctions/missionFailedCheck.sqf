/*
* missionFailedCheck.sqf
* checks wether given units (in this case the Pilot and WSO) is alive, if both are dead missions will be ended with mission failed screen
*/
diag_log "<<===missionFailedCheck.sqf===>> fired";

private ["_units"];

_units = (_this select 0);
_countunits = count _units;

_flightUnit1Dead = false;
_flightUnit2Dead = false;

switch (_countunits) do {  
case 0: {
	diag_log "<<===missionFailedCheck.sqf===>> mission failed, no Pilots selected";
	["End4", "BIS_fnc_endMission", true, true] call BIS_fnc_MP;
};

case 1: {
	diag_log "<<===missionFailedCheck.sqf===>> case 1, only one flight unit";
	waitUntil {
		sleep 10; 
		if (!alive (_units select (_countunits-1))) then {
			_flightUnit1Dead = true;
			diag_log "<<===missionFailedCheck.sqf===>> _flightUnit1Dead dead";		
			};
		
		_flightUnit2Dead = true;
		((_flightUnit1Dead )and (_flightUnit2Dead))
	};
	diag_log "<<===missionFailedCheck.sqf===>> mission failed, single flightunitdead";
	["End1", "BIS_fnc_endMission", true, true] call BIS_fnc_MP;
};

case 2: {
	diag_log "<<===missionFailedCheck.sqf===>> case 2, 2 flight units";
	waitUntil {
		sleep 10; 
		if (!alive (_units select (_countunits-1))) then {
			_flightUnit1Dead = true;
			diag_log "<<===missionFailedCheck.sqf===>> _flightUnit1Dead dead";		
			};
		
		if (!alive (_units select (_countunits-2))) then {
			_flightUnit2Dead = true;
			diag_log "<<===missionFailedCheck.sqf===>> _flightUnit2Dead dead";		
			};
		
		((_flightUnit1Dead)and(_flightUnit2Dead))
	};
	diag_log "<<===missionFailedCheck.sqf===>> mission failed, both flight units dead";
	["End1", "BIS_fnc_endMission", true, true] call BIS_fnc_MP;	
};

default {
	diag_log "<<===missionFailedCheck.sqf===>> mission failed, default";
	["End4", "BIS_fnc_endMission", true, true] call BIS_fnc_MP;
	};
};