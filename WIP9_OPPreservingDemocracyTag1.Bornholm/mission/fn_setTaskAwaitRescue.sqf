/**
* fn_setTaskAwaitRescue.sqf 
* @Descr: sets awaitRescue Task for Pilots
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


_tsk_pilot_awaitRescue = _unit createSimpleTask ["Rettung abwarten"];
_tsk_pilot_awaitRescue setSimpleTaskDescription ["Warten sie auf Rettung vom SAR Team. Bleiben sie in der Nähe der Abschlussstelle. Bleiben sie mit ihren Co-Piloten zusammen. Werfen sie bei Freundkontakt blauen Rauch. Verteidigen sie sich wenn nötig.","Rettung abwarten","Rettung abwarten"];
_tsk_pilot_awaitRescue setTaskState "ASSIGNED";
_unit setCurrentTask _tsk_pilot_awaitRescue;