/**
* fn_setTaskDestroyHelicopter.sqf 
* @Descr: sets Destroy Task for all
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


_tsk_all_desHeli = _unit createSimpleTask ["Helikopter zerstören"];
_tsk_all_desHeli setSimpleTaskDestination (getMarkerPos "Heli");
_tsk_all_desHeli setSimpleTaskDescription ["Zerstören sie den Helikopter, sodass die Rebellen ihn nicht in die Hände bekommen.","Helikopter zerstören","Helikopter zerstören"];
_tsk_all_desHeli setTaskState "ASSIGNED";
_unit setCurrentTask _tsk_all_desHeli;