/**
* fn_setTriggerVaribaleTrue.sqf 
* @Descr: sets missiontriggervariable true
* @Author: TDC | Shockwave
*
* @Arguments: -
* @Return: -
*/
_caller = (_this select 1);

SWM_missionTriggerVariable = true;
["Sauerkirschen!","hint",_caller] call BIS_fnc_MP;