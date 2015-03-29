/**
* fn_setTaskSAR.sqf 
* @Descr: sets SAR Task for QRF
* @Author: TDC | Shockwave
*
* @Arguments: -
* @Return: -
*/
private ["_unit"];

_unit = _this select 0;

_unitTasks = simpleTasks _unit;
_taskCount = count _unitTasks;
(_unitTasks select (_taskCount-1)) setTaskState "SUCCEEDED";

_tsk_qrf_sar = _unit createSimpleTask ["SAR"];
_tsk_qrf_sar setSimpleTaskDescription ["Suchen und Retten Sie die abgestürzten Piloten bevor die Rebellen ihnen Schaden zufügen. Bei Fund müssen die Personen identifiziert werden.","SAR","SAR"];
_tsk_qrf_sar setTaskState "ASSIGNED";
_unit setCurrentTask _tsk_qrf_sar;