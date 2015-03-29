/**
* fn_setTaskRTB.sqf 
* @Descr: sets RTB Task for everyone
* @Author: TDC | Shockwave
*
* @Arguments: -
* @Return: -
*/
private ["_unit"];

_unit = _this select 0;

_unitTasks = simpleTasks _unit;
_taskCount = count _unitTasks;
//hint format ["%1", _unitTasks];
//{_x setTaskState "SUCCEEDED";} foreach _unitTasks;
(_unitTasks select (_taskCount-1)) setTaskState "SUCCEEDED";


_tsk_all_RTB = _unit createSimpleTask ["RTB"];
_tsk_all_RTB setSimpleTaskDestination (getMarkerPos "Basis");
_tsk_all_RTB setSimpleTaskDescription ["Kehren sie zur Basis zurück.","RTB","RTB"];
_tsk_all_RTB setTaskState "ASSIGNED";
_unit setCurrentTask _tsk_all_RTB;