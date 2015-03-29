/**
* fn_markerClear.sqf 
* @Descr: Überprüft ob der Marker frei ist
* @Author: TDC | Shockwave & TDC | Insane
*
* @Arguments: -
* @Return: -
*/
private ["_marker"];
_nearVehArray = [];
_marker = (_this select 0);
{_nearVehArray = _nearVehArray+[_x select 1];} foreach TDC_vehReq_config;
_nearVeh = (getMarkerPos _marker) nearEntities [_nearVehArray, 10];
if (count _nearVeh == 0) exitWith {true};

false