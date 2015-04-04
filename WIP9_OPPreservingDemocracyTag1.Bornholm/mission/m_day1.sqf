if (!isServer) exitWith {};
diag_log "<-------------Mission-------------> start of missionscript";

//mission prepping--------------------------------------------------------------------------------------------------------------------------
//gernerate random SAM location
_locCount = count SWM_samLocs;
_ranNum= floor random _locCount;
_ranSamLoc = SWM_samLocs select _ranNum;
diag_log "<-------------Mission------------->samLocation set";

//create and equip Rebell SAM-Team and SAM-Location
_samTeam = [];
_samTeam = creategroup RESISTANCE; 
for "_i" from 1 to 4 do {"PMC_TL" createUnit [(getMarkerPos _ranSamLoc), _samTeam, "", SWM_aiSkill, "PRIVATE"];};
_samTeamUnits = units _samTeam;
[(_samTeamUnits select 0)] spawn SWM_fnc_setNInfBlue;
[(_samTeamUnits select 2)] spawn SWM_fnc_setNInfRed;
[(_samTeamUnits select 3)] spawn SWM_fnc_setNInfWhite;

_samTeamUnitAA = _samTeamUnits select 1;
[_samTeamUnitAA] spawn SWM_fnc_setNInfaa;
//_ehj = _samTeamUnitAA addEventHandler ["Fired", {
//if ((_this select 1) == "rhs_weap_igla") then {
//[] spawn SWM_fnc_heliCrashFailSafe;};}]; //setHeliDammage wether sam hits or not

diag_log format ["<-------------Mission-------------> Sam Team spawned at %1", _ranSamLoc];

//getArray of player ocupied units

//mp method
/*_allPlayers = [];
{
if ((!isNull _x) and (isPlayer _x)) then {
 _allPlayers pushBack _x;};
}forEach playableUnits;
*/

//sp test method
_allPlayers = [];
{
if (((groupId (group _x))=="Eagle") or ((groupId (group _x))=="Weasel1") or ((groupId (group _x))=="Weasel2")) then {
_allPlayers pushBack _x;};
}forEach allUnits;

diag_log format ["<-------------Mission-------------> _allPlayers array %1", _allPlayers];

//sort players/units into arrays that correpond to their groups
_playerUnitsFlight = [];
_playerUnitsQRF = [];
_playerUnitsQRFAlpha = [];
_playerUnitsQRFBravo = [];

{
switch (groupId (group _x)) do 
{  
case "Eagle": {_playerUnitsFlight pushBack _x;};
case "Weasel1": {_playerUnitsQRF pushBack _x; _playerUnitsQRFAlpha pushBack _x;};
case "Weasel2": {_playerUnitsQRF pushBack _x; _playerUnitsQRFBravo pushBack _x;};
default {};
};
}forEach _allPlayers;
diag_log format ["<-------------Mission-------------> qrf group: %1...flight group %2",_playerUnitsQRF,_playerUnitsFlight];

//STAGE 0 ---------------------------------------------------------------------------------------------------------------------------------
diag_log "<-------------Mission-------------> STAGE 0";
sleep 5;

//STAGE 0 tasks and Notifications
//sleep 600; -->so time initialized fits with briefing
//Task for QRF-Alpha
if ((count _playerUnitsQRFAlpha) >0) then {
{if (alive _x) then {
[[_x,//unit
"Bereitschaft",//tsk title
"Bleiben sie in Bereitschaft",//tsk desc
"Bereitschaft",//wptag
true, //add tsk location?
(getMarkerPos "Basis")//tsk location
], "SWM_fnc_createTask", _x, true, false] call BIS_fnc_MP;
};
}forEach _playerUnitsQRFAlpha;
[["TaskAssigned",["","Bereitschaft"]], "BIS_fnc_showNotification", (group (_playerUnitsQRFAlpha select 0)),true,false] call BIS_fnc_MP;
};

//tasks for QRF-Bravo
if ((count _playerUnitsQRFBravo) >0) then {
{if (alive _x) then {
[[_x,//unit
"Bereitschaft",//tsk title
"Bleiben sie in Bereitschaft",//tsk desc
"Bereitschaft",//wptag
true, //add tsk location?
(getMarkerPos "Basis")//tsk location
], "SWM_fnc_createTask", _x, true, false] call BIS_fnc_MP;
};
}forEach _playerUnitsQRFBravo;
[["TaskAssigned",["","Bereitschaft"]], "BIS_fnc_showNotification", (group (_playerUnitsQRFBravo select 0)),true,false] call BIS_fnc_MP;
};

//sleep 120; -->so time initialized fits with briefing
//task for Flight
if ((count _playerUnitsFlight) >0) then {
{if ((!isNull _x) and (isPlayer _x) and (alive _x)) then {
[[_x,//unit
"Patrouillenflug",//tsk title
"Gehen sie auf Patrouillenflug entlang der auf der Karte markierten Wegpunkte",//tsk desc
"Patrouillenflug",//wptag
true, //add tsk location?
(getPos Heli)//tsk location (array)
], "SWM_fnc_createTask", _x, true, false] call BIS_fnc_MP;
};
}forEach _playerUnitsFlight;
[["TaskAssigned",["","Patrouillenflug"]], "BIS_fnc_showNotification", (group (_playerUnitsFlight select 0)),true,false] call BIS_fnc_MP;
};
diag_log "<-------------Mission-------------> Tasks set and notified";

//HeliCrash Trigger
waitUntil {
	sleep 5;
	_dis = Heli distance (getPos _samTeamUnitAA);
	(_dis < 2000)
};
diag_log "<-------------Mission-------------> HeliCrash Trigger fired";

//Gets AI-SAM to shoot at Helicopter
_samTeamUnitAA reveal [Heli,1];
_samTeamUnitAA doTarget Heli;
_samTeamUnitAA doFire Heli;
diag_log "<-------------Mission-------------> AI aimed";

waitUntil {};

