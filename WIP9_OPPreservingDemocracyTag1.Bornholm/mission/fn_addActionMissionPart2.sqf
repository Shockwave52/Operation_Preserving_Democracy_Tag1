/**
* fn_addActionMissionPart2.sqf 
* @Descr: adds Action to Pilot and WSO (if player controlled) to trigger mission part 2
* @Author: TDC | Shockwave
*
* @Arguments: -
* @Return: -
*/
_unit = (_this select 0);

if((isPlayer _unit) and (isPlayer Pilot)) then {Pilot addAction ["Was war's Letzte?", "mission\setTriggerVariableTrue.sqf", nil, 1.5, true, true, "","!SWM_missionTriggerVariable"];} else {};
if((isPlayer _unit) and (isPlayer WSO)) then {WSO addAction ["Was war's Letzte?", "mission\setTriggerVariableTrue.sqf", nil, 1.5, true, true, "","!SWM_missionTriggerVariable"];} else {};