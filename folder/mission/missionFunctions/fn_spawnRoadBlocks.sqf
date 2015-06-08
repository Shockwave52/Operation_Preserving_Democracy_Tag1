/*
* fn_spawnRoadBlocks.sqf 
* @Descr: spawns Roadblocks on marker locations defined in config
* @Author: TDC | Shockwave
*
* @Arguments: -
* @Return: -
*/
diag_log "<-------------spawnRoadblocks-------------> fired";
//spawn vehicles
_arrayCountveh = count SWM_roadblockMarkersVeh;
for [{_i=0},{_i<_arrayCountveh},{_i=_i+1}] do {
_veh = ((SWM_roadblockMarkersVeh select _i) select 1) createVehicle (getMarkerPos ((SWM_roadblockMarkersVeh select _i) select 0));
_veh setDir((SWM_roadblockMarkersVeh select _i) select 2);
};

//spawns offroad at predefined locations
{
_veh = "I_G_Offroad_01_armed_F" createVehicle (getMarkerPos (_x)); 

_group = [];
_group = creategroup RESISTANCE; 

for "_j" from 1 to 3 do {"PMC_TL" createUnit [(getMarkerPos (_x)), _group, "", SWM_aiSkill, "PRIVATE"];};
_groupUnits = units _group;

[(_groupUnits select 0)] spawn SWM_fnc_setNInfBlue;
[(_groupUnits select 1)] spawn SWM_fnc_setNInfWhite;
[(_groupUnits select 2)] spawn SWM_fnc_setNInfRed;

(_groupUnits select 0) moveInDriver _veh;
(_groupUnits select 1) moveInGunner _veh;
(_groupUnits select 2) moveInCargo _veh;
} foreach SWM_roadblockMarkersOffroads;

//spawns infantry at roadblocks
_arrayCountinf = count SWM_roadblockMarkersInf;
for [{_l=0},{_l<_arrayCountveh},{_l=_l+1}] do {
if (((SWM_roadblockMarkersInf select _l)select 1)=="light") then {
_group = [];
_group = creategroup RESISTANCE; 

for "_x" from 1 to 4 do {
"PMC_TL" createUnit [(getMarkerPos ((SWM_roadblockMarkersInf select _l)select 0)), _group, "", SWM_aiSkill, "PRIVATE"];};
_groupUnits = units _group;

[(_groupUnits select 0)] spawn SWM_fnc_setNInfBlue;
[(_groupUnits select 1)] spawn SWM_fnc_setNInfBlue;
[(_groupUnits select 2)] spawn SWM_fnc_setNInfRed;
[(_groupUnits select 3)] spawn SWM_fnc_setNInfWhite;

}else{
_group = [];
_group = creategroup RESISTANCE; 

for "_z" from 1 to 4 do {"PMC_TL" createUnit [(getMarkerPos ((SWM_roadblockMarkersInf select _l)select 0)), _group, "", SWM_aiSkill, "PRIVATE"];};
_groupUnits = units _group;

[(_groupUnits select 0)] spawn SWM_fnc_setNInfBlue;
[(_groupUnits select 1)] spawn SWM_fnc_setNInfGL;
[(_groupUnits select 2)] spawn SWM_fnc_setNInfAT;
[(_groupUnits select 3)] spawn SWM_fnc_setNInfRed;

};
};
diag_log "<-------------spawnRoadblocks-------------> completed";