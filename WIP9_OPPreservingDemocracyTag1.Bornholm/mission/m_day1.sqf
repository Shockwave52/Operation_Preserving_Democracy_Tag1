if (!isServer) exitWith {};
diag_log "###Mission DEBUG";

//gernerate random SAM location
_samLocs = ["sam1", "sam2", "sam3"];
_ranNum = random 3;
_ranNum = floor _ranNum;
_ranSamLoc = _samLocs select _ranNum;
hint format ["%1", _ranSamLoc];

//create and equip Rebell SAM-Team
_samTeam = [];
_samTeam = creategroup RESISTANCE; 
for "_i" from 1 to 4 do {"PMC_TL" createUnit [(getMarkerPos _ranSamLoc), _samTeam, "", SWM_aiSkill, "PRIVATE"];};
_samTeamUnits = units _samTeam;
[(_samTeamUnits select 0)] spawn SWM_fnc_setNInfBlue;
[(_samTeamUnits select 2)] spawn SWM_fnc_setNInfRed;
[(_samTeamUnits select 3)] spawn SWM_fnc_setNInfWhite;

_samTeamUnitAA = _samTeamUnits select 1;
[_samTeamUnitAA] spawn SWM_fnc_setNInfaa;
_ehj = _samTeamUnitAA addEventHandler ["Fired", {if ((_this select 1) == "rhs_weap_igla") then {[] spawn SWM_fnc_heliCrashFailSafe;} else {};}]; //setHeliDammage wether sam hits or not

//create STAGE 0 Tasks for Players
sleep 5;//sleep 600; //delay damit taskzeit mit Breifeing stimmt
{if (isPlayer _x) then {
[[_x], "SWM_fnc_setTaskStandby", true, true, false] call BIS_fnc_MP;}
else {};} forEach SWM_QRFUnits;
[["TaskAssigned",["","Bereitschaft"]], "BIS_fnc_showNotification", true,true,false] call BIS_fnc_MP;

//sleep 120; //delay damit taskzeit mit Breifeing stimmt
{if (isPlayer _x) then {
[[_x], "SWM_fnc_setTaskPatrolFlight", true, true, false] call BIS_fnc_MP;}
else {};}forEach SWM_flightUnits;
[["TaskAssigned",["","Patrouillenflug"]], "BIS_fnc_showNotification", true,true,false] call BIS_fnc_MP;

//HeliCrash Trigger
waitUntil {
	sleep 5;
	_dis = Heli distance (getPos _samTeamUnitAA);
	(_dis < 2000)
};

//Gets AI-SAM to shoot at Helicopter
_samTeamUnitAA reveal [Heli,1];
_samTeamUnitAA doTarget Heli;
_samTeamUnitAA doFire Heli;

//STAGE 1 Trigger
waitUntil 
{
	sleep 2;
	_inVeh = crew Heli;
	_inVehCount = count _inVeh;
	(_inVehCount == 0)
};

//removes all radios from Helicopter crew
if (isPlayer Pilot) then {{Pilot removeItem _x;} forEach (call acre_api_fnc_getCurrentRadioList);} else {};
if (isPlayer WSO) then {{WSO removeItem _x;} forEach (call acre_api_fnc_getCurrentRadioList);} else {};
hint "radios/Stage 1";

//create STAGE 1 Tasks for Players
[["TaskSucceeded",["","Bereitschaft"]], "BIS_fnc_showNotification", true,true,false] call BIS_fnc_MP;
[["TaskSucceeded",["","Patrouillenflug"]], "BIS_fnc_showNotification", true,true,false] call BIS_fnc_MP;

{if (isPlayer _x) then {
[[_x], "SWM_fnc_setTaskSAR", true, true, false] call BIS_fnc_MP;}
else{};}forEach SWM_QRFUnits;
[["TaskAssigned",["","SAR"]], "BIS_fnc_showNotification",true,true,false] call BIS_fnc_MP;

{if (isPlayer _x) then {
[[_x], "SWM_fnc_setTaskAwaitRescue", true, true, false] call BIS_fnc_MP;}
else{}; }forEach SWM_flightUnits;
[["TaskAssigned",["","Rettung abwarten"]], "BIS_fnc_showNotification", true,true,false] call BIS_fnc_MP;

//STAGE 1 SAM-Team Waypoint and AI-Spawn

//sleep 120;
_wps = _samTeam addWaypoint [(getPos Heli), 100];
_wps setWaypointType "SAD";
_samTeam setCombatMode "RED";


_group1 = [_ranSamLoc] call SWM_fnc_spawnLightAIGroup;
_wpg1 = _group1 addWaypoint [(getPos Pilot), 200];
_wpg1 setWaypointType "SAD";
_group1 setCombatMode "RED";

//STAGE 2 Trigger
waitUntil {
sleep 5;
_minDis = [] call SWM_fnc_getMinDistanceAll;
hint format ["%1", _minDis];
(_minDis < 2000)
};

hint "STAGE 2";
//STAGE 2 AIspawn
_group2 = [_ranSamLoc] call SWM_fnc_spawnLightAIGroup;
_wpg2 = _group2 addWaypoint [(getPos Pilot), 200];
_wpg2 setWaypointType "SAD";
_group2 setCombatMode "RED";
sleep 10;
_group3 = [_ranSamLoc] call SWM_fnc_spawnHeavyAIGroup;
_wpg3 = _group3 addWaypoint [(getPos Pilot), 200];
_wpg3 setWaypointType "SAD";
_group3 setCombatMode "RED";
sleep 10;
_group4 = [_ranSamLoc] call SWM_fnc_spawnLightAIGroup;
_wpg4 = _group4 addWaypoint [(getPos Pilot), 200];
_wpg4 setWaypointType "SAD";
_group4 setCombatMode "RED";
sleep 10;
_groupoff1 = [_ranSamLoc] call SWM_fnc_spawnOffroad;
_wpgo1 = _groupoff1 addWaypoint [(getPos Pilot), 200];
_wpgo1 setWaypointType "SAD";
_groupoff1 setCombatMode "RED";

{if(isPlayer _x) then {[[_x], "SWM_fnc_addActionMissionPart2", _x] call BIS_fnc_MP;} else {};} forEach SWM_QRFUnits;

//STAGE 3 Trigger
waitUntil {
	sleep 5;
	(SWM_missionTriggerVariable)
};
hint "STAGE 3";

//Create STAGE 3 Tasks
[["TaskSucceeded",["","SAR"]], "BIS_fnc_showNotification", true,true,false] call BIS_fnc_MP;
[["TaskSucceeded",["","Rettung abwarten"]], "BIS_fnc_showNotification", true,true,false] call BIS_fnc_MP;

{if (isPlayer _x) then {[[_x], "SWM_fnc_setTaskDestroyHelicopter", true, true, false] call BIS_fnc_MP;}
else {};}forEach SWM_everyUnit;
[["TaskAssigned",["","Helikopter zerstören"]], "BIS_fnc_showNotification", true,true,false] call BIS_fnc_MP;

//STAGE 3 AISpawn
_group5 = [_ranSamLoc] call SWM_fnc_spawnHeavyAIGroup;
_wpg5 = _group5 addWaypoint [(getPos Pilot), 200];
_wpg5 setWaypointType "SAD";
_group5 setCombatMode "RED";

_groupoff2 = [_ranSamLoc] call SWM_fnc_spawnOffroad;
_wpgo2 = _groupoff2 addWaypoint [(getPos Pilot), 200];
_wpgo2 setWaypointType "SAD";
_groupoff2 setCombatMode "RED";

//STAGE 4 Trigger
waitUntil
{
	sleep 5;
	_damage = getDammage Heli;
	(_damage == 1)
};
hint "STAGE4";

//STAGE 4 Tasks
[["TaskSucceeded",["","Helikopter zerstören"]], "BIS_fnc_showNotification", true,true,false] call BIS_fnc_MP;
{if (isPlayer _x) then{[[_x], "SWM_fnc_setTaskRTB", true, true, false] call BIS_fnc_MP;}
else {};}forEach SWM_everyUnit;
[["TaskAssigned",["","RTB"]], "BIS_fnc_showNotification", true,true,false] call BIS_fnc_MP;

//spawn STAGE 4 Roadblocks
[] spawn SWM_fnc_spawnRoadBlocks;

//mission victory condition
waitUntil {
	sleep 5;
	_disPilot_Base = Pilot distance (getmarkerpos "Basis");
	_disWSO_Base = WSO distance (getmarkerpos "Basis");
	((_disPilot_Base < 100) or (_disWSO_Base < 100))
};
"End2" call BIS_fnc_endMission; //outro and debrief