/**
* fn_setTaskStandby.sqf 
* @Descr: sets Standby Task for QRF
* @Author: TDC | Shockwave
*
* @Arguments: -
* @Return: -
*/
private ["_unit"];

_unit = _this select 0;

_tsk_qrf_standby = _unit createSimpleTask ["Bereitschaft"];
_tsk_qrf_standby setSimpleTaskDestination (getMarkerPos "Basis");
_tsk_qrf_standby setSimpleTaskDescription ["Bleiben sie in Bereitschaft","Bereitschaft","Bereitschaft"];
_tsk_qrf_standby setTaskState "ASSIGNED";
_unit setCurrentTask _tsk_qrf_standby;