/**
* fn_createTask.sqf 
* @Descr: creates tasks with given arguments
* @Author: TDC | Shockwave
*
* @Arguments: -
* @Return: -
*/
private ["_unitTasks","_unit","_taskCount","_title", "_descr", "_wpTag","_conLoc", "_loc", "_tsk"];

_unit = (_this select 0); //unit the task is to be assigned to
_title = (_this select 1); //title of the task
_descr = (_this select 2); //task description
_wpTag = (_this select 3); //HUD-Waypoint text
_conLoc = (_this select 4); //if false, no location will be added
_loc = (_this select 5); //task location

_unitTasks = simpleTasks _unit;
_taskCount = count _unitTasks;
if (_taskCount>0) then {(_unitTasks select (_taskCount-1)) setTaskState "SUCCEEDED";};

_tsk = _unit createSimpleTask [_title];
_tsk setSimpleTaskDescription [_descr,_title,_wpTag];
if (_conLoc) then {_tsk setSimpleTaskDestination (_loc);};
_tsk setTaskState "ASSIGNED";
_unit setCurrentTask _tsk;