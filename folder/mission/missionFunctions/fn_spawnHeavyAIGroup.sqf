/**
* fn_spawnHeavyAIGroup.sqf 
* @Descr: spawns heavyer armored AI-Group, returns created group
* @Author: TDC | Shockwave
*
* @Arguments: -
* @Return: -
*/

diag_log "<-------------spawnHeavyAIGroup-------------> fired";

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
[(_groupUnits select 1)] spawn SWM_fnc_setNInfGL;
[(_groupUnits select 2)] spawn SWM_fnc_setNInfAT;
[(_groupUnits select 3)] spawn SWM_fnc_setNInfRed;

diag_log format ["<-------------spawnHeavyAIGroup-------------> Heavy AI spawned at %1", (_spawns select _ranNum)];

_group