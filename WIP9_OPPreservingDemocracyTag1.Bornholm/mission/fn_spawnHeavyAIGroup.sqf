/**
* fn_spawnLightAIGroup.sqf 
* @Descr: spawns heavylyer armored AI-Group, retunrs created group
* @Author: TDC | Shockwave
*
* @Arguments: -
* @Return: -
*/

_samloc = (_this select 0);
_spawns = [];

if (_samloc == "sam1") then {_spawns = ["sam1aispawn1", "sam1aispawn2", "sam1aispawn3", "wp2"];};
if (_samloc == "sam2") then {_spawns = ["sam2aispawn1", "sam2aispawn2", "sam2aispawn2", "wp3"];};
if (_samloc == "sam3") then {_spawns = ["sam3aispawn1", "sam3aispawn2", "sam3aispawn3", "sam3aispawn4"];};

_ranNum = random 4;
_ranNum = floor _ranNum;

_group = [];
_group = creategroup RESISTANCE; 

for "_x" from 1 to 4 do {"PMC_TL" createUnit [(getMarkerPos (_spawns select _ranNum)), _group, "", SWM_aiSkill, "PRIVATE"];};
_groupUnits = units _group;

[(_groupUnits select 0)] spawn SWM_fnc_setNInfBlue;
[(_groupUnits select 1)] spawn SWM_fnc_setNInfGL;
[(_groupUnits select 2)] spawn SWM_fnc_setNInfAT;
[(_groupUnits select 3)] spawn SWM_fnc_setNInfRed;

_group