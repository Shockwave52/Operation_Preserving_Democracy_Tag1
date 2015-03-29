/**
* fn_removeActionMissionPart2.sqf 
* @Descr: removes Action to Pilot and WSO (if player controlled) to trigger mission part 2
* @Author: TDC | Shockwave
*
* @Arguments: -
* @Return: -
*/
_unit = (_this select 0);
_index = (_this select 1);

if((isPlayer _unit) and (isPlayer Pilot)) then {Pilot removeAction _index;} else {};
if((isPlayer _unit) and (isPlayer WSO)) then {WSO removeAction _index;} else {};