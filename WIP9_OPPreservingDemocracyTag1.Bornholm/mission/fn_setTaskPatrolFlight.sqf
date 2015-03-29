/**
* fn_setTaskPatrolFlight.sqf 
* @Descr: sets PatrolFlight Task for Pilots
* @Author: TDC | Shockwave
*
* @Arguments: -
* @Return: -
*/
private ["_unit"];

_unit = _this select 0;

_tsk_flight_patrol = _unit createSimpleTask ["Patrouillenflug"];
_tsk_flight_patrol setSimpleTaskDestination (getPos Heli);
_tsk_flight_patrol setSimpleTaskDescription ["Gehen sie auf Patrouillenflug entlang der Wegpunkte","Patrouillenflug","Patrouillenflug"];
_tsk_flight_patrol setTaskState "ASSIGNED";
_unit setCurrentTask _tsk_flight_patrol;