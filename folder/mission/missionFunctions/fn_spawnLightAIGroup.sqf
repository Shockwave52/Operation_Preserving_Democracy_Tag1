/**
* fn_spawnLightAIGroup.sqf 
* @Descr: spawns lightly armored AI-Group, retunrs created group
* @Author: TDC | Shockwave
*
* @Arguments: -
* @Return: -
*/

diag_log "<-------------spawnLightAIGroup-------------> fired";

_samloc = (_this select 0);
_spawns = [];

if (_samloc == "sam1") then {_spawns = SWM_aiSpawnsSam1;};
if (_samloc == "sam2") then {_spawns = SWM_aiSpawnsSam2;};
if (_samloc == "sam3") then {_spawns = SWM_aiSpawnsSam3;};

_spawnscount = count _spawns;
_ranNum = floor random _spawnscount;

_group = [];
_group = creategroup RESISTANCE; 

for "_x" from 1 to 4 do {"PMC_TL" createUnit [(getMarkerPos (_spawns select _ranNum)), _group, "", SWM_aiSkill, "PRIVATE"];};
_groupUnits = units _group;

[(_groupUnits select 0)] spawn SWM_fnc_setNInfBlue;
[(_groupUnits select 1)] spawn SWM_fnc_setNInfBlue;
[(_groupUnits select 2)] spawn SWM_fnc_setNInfRed;
[(_groupUnits select 3)] spawn SWM_fnc_setNInfWhite;

diag_log format ["<-------------spawnLightAIGroup-------------> Light AI spawned at %1", (_spawns select _ranNum)];

_group