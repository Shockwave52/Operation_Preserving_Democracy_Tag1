if (!isServer) exitWith {};
diag_log "<-------------Mission-------------> start of missionscript";

//mission prepping==========================================================================================================================================
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

diag_log format ["<-------------Mission-------------> Sam Team spawned at %1", _ranSamLoc];

//getArray of player ocupied units
_allPlayers = [];

//mp method
{if ((!isNull _x) and (isPlayer _x)) then {
	_allPlayers pushBack _x;
	};
}forEach playableUnits;
	
/*//sp test method
{if (((groupId (group _x))=="Eagle") or ((groupId (group _x))=="Weasel1") or ((groupId (group _x))=="Weasel2")) then {
	_allPlayers pushBack _x;
	};
}forEach allUnits;*/

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

//mission failed trigger
if ((count _playerUnitsQRF)==0) then {
	["End4", "BIS_fnc_endMission", true, true] call BIS_fnc_MP;
	} else {
	[_playerUnitsFlight]execVM "mission\missionFunctions\missionFailedCheck.sqf";
	diag_log "<-------------Mission-------------> Mission failed trigger initialized";
};

//STAGE 0 =================================================================================================================================================================
diag_log "<-------------Mission-------------> STAGE 0";

//STAGE 0 tasks and Notifications
//sleep 600; //-->so time initialized fits with briefing
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
		diag_log format ["<-------------Mission-------------> task added to %1", _x];
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
		diag_log format ["<-------------Mission-------------> task added to %1", _x];
	}forEach _playerUnitsQRFBravo;
[["TaskAssigned",["","Bereitschaft"]], "BIS_fnc_showNotification", (group (_playerUnitsQRFBravo select 0)),true,false] call BIS_fnc_MP;
};

//sleep 120; //-->so time initialized fits with briefing
//task for Flight
if ((count _playerUnitsFlight) >0) then {
	{if ((!isNull _x) and (isPlayer _x) and (alive _x)) then {
		[[_x,//unit
		"Patrouillenflug",//tsk title
		"Gehen sie auf Patrouillenflug entlang der der Karte markierten Wegpunkte <font color=""#00FFFF""><marker name=""wp1"">HeliWP1</marker>, <marker name=""wp2"">HeliWP2</marker>, <marker name=""wp3"">HeliWP3</marker>, <marker name=""wp4"">HeliWP4</marker>, <marker name=""wp5"">HeliWP5</marker></font> und <font color=""#00FFFF""><marker name=""wp6"">HeliWP6</marker></font>.",//tsk desc
		"Patrouillenflug",//wptag
		true, //add tsk location?
		(getPos Heli)//tsk location (array)
		], "SWM_fnc_createTask", _x, true, false] call BIS_fnc_MP;
		};
		diag_log format ["<-------------Mission-------------> task added to %1", _x];
	}forEach _playerUnitsFlight;
[["TaskAssigned",["","Patrouillenflug"]], "BIS_fnc_showNotification", (group (_playerUnitsFlight select 0)),true,false] call BIS_fnc_MP;
};
diag_log "<-------------Mission-------------> STAGE 0 Tasks set and notified";

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
diag_log "<-------------Mission-------------> AI aimed";

//FailSafe HeliCrash Trigger
waitUntil {
	sleep 3;
	_disA = Heli distance (getPos _samTeamUnitAA);
	sleep 1;
	_disB = Heli distance (getPos _samTeamUnitAA);
	_heliHit = missionNamespace getVariable "SWM_HeliHit";
	diag_log format ["<-------------Mission-------------> heli hit %1, disA: %2, disB %3",_heliHit, _disA, _disB];
	((_heliHit) or (_disA < _disB))
};
diag_log "<-------------Mission-------------> FailSafe Trigger fired";

_heliHit = missionNamespace getVariable "SWM_HeliHit"; 
diag_log format ["<-------------Mission-------------> Heli hit? %1, SWM_HeliHit %2", _heliHit, (missionNamespace getVariable "SWM_HeliHit")];
if (!(_heliHit)) then {
[[false], "SWM_fnc_samStrike", (crew Heli), true, false] call BIS_fnc_MP;}; 

//STAGE 1 ==========================================================================================================================================================
//STAGE 1 Trigger
waitUntil 
{
	sleep 2;
	_inVeh = crew Heli;
	_inVehCount = count _inVeh;
	(_inVehCount == 0)
};
diag_log "<-------------Mission-------------> STAGE 1";

//STAGE 1 task Flight
if ((count _playerUnitsFlight) >0) then {
	[[], "SWM_fnc_removeRadios",(group (_playerUnitsFlight select 0)), true, true] call BIS_fnc_MP;
	diag_log "<-------------Mission-------------> radios removed";
	[["TaskSucceeded",["","Patrouillenflug"]], "BIS_fnc_showNotification", (group (_playerUnitsFlight select 0)),true,false] call BIS_fnc_MP;
		
	{[[_x,//unit
	"Rettung abwarten",//tsk title
	"Warten sie auf Rettung vom SAR Team. Bleiben sie in der Nähe der Abschussstelle. Bleiben sie mit ihren Co-Piloten zusammen. Werfen sie bei Freundkontakt blauen Rauch. Verteidigen sie sich wenn nötig.",//tsk desc
	"Rettung abwarten",//wptag
	false, //add tsk location?
	nil//tsk location (array)
	], "SWM_fnc_createTask", _x, true, false] call BIS_fnc_MP;
	}forEach _playerUnitsFlight;
	
	[["TaskAssigned",["","Rettung abwarten"]], "BIS_fnc_showNotification", (group (_playerUnitsFlight select 0)),true,false] call BIS_fnc_MP;
};

//STAGE 1 QRF-Alpha
if ((count _playerUnitsQRFAlpha) >0) then {
	[[], "SWM_fnc_removeRadios",(group (_playerUnitsQRFAlpha select 0)), true, true] call BIS_fnc_MP;
	diag_log "<-------------Mission-------------> radios removed";
	[["TaskSucceeded",["","Bereitschaft"]], "BIS_fnc_showNotification", (group (_playerUnitsQRFAlpha select 0)),true,false] call BIS_fnc_MP;
		
	{[[_x,//unit
	"SAR",//tsk title
	"Suchen und Retten Sie die abgestürzten Piloten bevor die Rebellen ihnen Schaden zufügen. Bei Fund müssen die Piloten als solche identifiziert werden.",//tsk desc
	"SAR",//wptag
	false, //add tsk location?
	nil//tsk location (array)
	], "SWM_fnc_createTask", _x, true, false] call BIS_fnc_MP;
	}forEach _playerUnitsQRFAlpha;
	
	[["TaskAssigned",["","SAR"]], "BIS_fnc_showNotification", (group (_playerUnitsQRFAlpha select 0)),true,false] call BIS_fnc_MP;
};

//STAGE 1 task QRF-Bravo
if ((count _playerUnitsQRFBravo) >0) then {
	[[], "SWM_fnc_removeRadios",(group (_playerUnitsQRFBravo select 0)), true, true] call BIS_fnc_MP;
	diag_log "<-------------Mission-------------> radios removed";
	[["TaskSucceeded",["","Bereitschaft"]], "BIS_fnc_showNotification", (group (_playerUnitsQRFBravo select 0)),true,false] call BIS_fnc_MP;
		
	{[[_x,//unit
	"SAR",//tsk title
	"Suchen und Retten Sie die abgestürzten Piloten bevor die Rebellen ihnen Schaden zufügen. Bei Fund müssen die Personen identifiziert werden.",//tsk desc
	"SAR",//wptag
	false, //add tsk location?
	nil//tsk location (array)
	], "SWM_fnc_createTask", _x, true, false] call BIS_fnc_MP;
	}forEach _playerUnitsQRFBravo;
	
	[["TaskAssigned",["","SAR"]], "BIS_fnc_showNotification", (group (_playerUnitsQRFBravo select 0)),true,false] call BIS_fnc_MP;
};
diag_log "<-------------Mission-------------> STAGE 1 Tasks set and notified";

//sleep 120;
_wps = _samTeam addWaypoint [(getPos Heli), 100];
_wps setWaypointType "SAD";
_samTeam setCombatMode "RED";
diag_log "<-------------Mission-------------> sam team wp set";

_group1 = [_ranSamLoc] call SWM_fnc_spawnLightAIGroup;
_wpg1 = _group1 addWaypoint [(getPos (_playerUnitsFlight select 0)), 100];
_wpg1 setWaypointType "SAD";
_group1 setCombatMode "RED";

diag_log "<-------------Mission-------------> STAGE 1 AI spawned and moving";

//STAGE 2 ==========================================================================================================================================================
//STAGE 2 Trigger
waitUntil {
	sleep 5;
	_minDis = [_playerUnitsFlight, _playerUnitsQRF] call SWM_fnc_getMinDistanceBetweenUnits;
	diag_log format ["<-------------Mission-------------> _minDis %1", _minDis];
	(_minDis < 2000)
};
diag_log "<-------------Mission-------------> STAGE 2";

//STAGE 2 AIspawn
_group2 = [_ranSamLoc] call SWM_fnc_spawnLightAIGroup;
_wpg2 = _group2 addWaypoint [(getPos (_playerUnitsFlight select 0)), 200];
_wpg2 setWaypointType "SAD";
_group2 setCombatMode "RED";
sleep 5;
_group3 = [_ranSamLoc] call SWM_fnc_spawnHeavyAIGroup;
_wpg3 = _group3 addWaypoint [(getPos (_playerUnitsFlight select 0)), 200];
_wpg3 setWaypointType "SAD";
_group3 setCombatMode "RED";
sleep 5;
_group4 = [_ranSamLoc] call SWM_fnc_spawnLightAIGroup;
_wpg4 = _group4 addWaypoint [(getPos (_playerUnitsFlight select 0)), 200];
_wpg4 setWaypointType "SAD";
_group4 setCombatMode "RED";
sleep 5;
_groupoff1 = [_ranSamLoc] call SWM_fnc_spawnOffroad;
_wpgo1 = _groupoff1 addWaypoint [(getPos (_playerUnitsFlight select 0)), 200];
_wpgo1 setWaypointType "SAD";
_groupoff1 setCombatMode "RED";
diag_log "<-------------Mission-------------> STAGE 2 AI spawned and moving";


//STAGE 3 ==========================================================================================================================================================
//action for trigger
_countFlightUnits = count _playerUnitsFlight;
for [{_i= 1},{(_countFlightUnits - _i)>=0},{_i = _i + 1}] do {
	_selector = _countFlightUnits - _i;
	diag_log format ["<-------------Mission-------------> Action to be added to %1", (_playerUnitsFlight select _selector)];
	
if ((count _playerUnitsQRFAlpha) >0) then {
	[[(_playerUnitsFlight select _selector), 
	["Was war's letzte?", 
	"mission\missionfunctions\identifyPilots.sqf", 
	[(group (_playerUnitsQRFAlpha select 0)),(group (_playerUnitsQRFBravo select 0)), _playerUnitsFlight],
	1.5,
	true,
	true,
	"",
	"(alive _target)"
	]], "addAction", (group (_playerUnitsQRFAlpha select 0)), true] call BIS_fnc_MP;
	diag_log format ["<-------------Mission-------------> Action added for QRF-Alpha to %1", (_playerUnitsFlight select _selector)];
	};
	
if ((count _playerUnitsQRFBravo) >0) then {
	[[(_playerUnitsFlight select _selector), 
	["Was war's letzte?", 
	"mission\missionfunctions\identifyPilots.sqf", 
	[(group (_playerUnitsQRFAlpha select 0)),(group (_playerUnitsQRFBravo select 0)), _playerUnitsFlight],
	1.5,
	true,
	true,
	"",
	"(alive _target)"
	]], "addAction", (group (_playerUnitsQRFBravo select 0)), true] call BIS_fnc_MP;	
	diag_log format ["<-------------Mission-------------> Action added for QRF-Bravo to %1", (_playerUnitsFlight select _selector)];
	};
};

//STAGE 3 Trigger
waitUntil {
	sleep 5;
	_bool = missionNamespace getVariable "SWM_pilotsIdentified";
	diag_log format ["<-------------Mission-------------> pilotsidentified %1", _bool];
	(_bool)
};
diag_log "<-------------Mission-------------> STAGE 3";

[["TaskSucceeded",["","Rettung abwarten"]], "BIS_fnc_showNotification", (group (_playerUnitsFlight  select 0)),true,false] call BIS_fnc_MP;
if ((count _playerUnitsQRFAlpha) >0) then {
	[["TaskSucceeded",["","SAR"]], "BIS_fnc_showNotification", (group (_playerUnitsQRFAlpha select 0)),true,false] call BIS_fnc_MP;
	};
if ((count _playerUnitsQRFBravo) >0) then {
	[["TaskSucceeded",["","SAR"]], "BIS_fnc_showNotification", (group (_playerUnitsQRFBravo select 0)),true,false] call BIS_fnc_MP;
	};

{[[_x,//unit
	"Helikopter zerstören",//tsk title
	"Zerstören sie den Helikopter, sodass die Rebellen ihn nicht in die Hände bekommen.",//tsk desc
	"Helikopter zerstören",//wptag
	false, //add tsk location?
	nil //tsk location (array)
	], "SWM_fnc_createTask", _x, true, false] call BIS_fnc_MP;
}forEach _allPlayers;
[["TaskAssigned",["","Helikopter zerstören"]], "BIS_fnc_showNotification", WEST,true,false] call BIS_fnc_MP;
diag_log "<-------------Mission-------------> STAGE 3 Tasks set and notified";

//STAGE 3 AISpawn
_group5 = [_ranSamLoc] call SWM_fnc_spawnHeavyAIGroup;
_wpg5 = _group5 addWaypoint [(getPos (_playerUnitsFlight select 0)), 200];
_wpg5 setWaypointType "SAD";
_group5 setCombatMode "RED";
sleep 5;
_groupoff2 = [_ranSamLoc] call SWM_fnc_spawnOffroad;
_wpgo2 = _groupoff2 addWaypoint [(getPos (_playerUnitsFlight select 0)), 200];
_wpgo2 setWaypointType "SAD";
_groupoff2 setCombatMode "RED";
diag_log "<-------------Mission-------------> STAGE 3 AI spawned and moving";

//STAGE 4 ==========================================================================================================================================================
waitUntil
{
	sleep 3;
	_heliDes = missionNamespace getVariable "SWM_heliDestroyed";
	diag_log format ["<-------------Mission-------------> helidestroyed %1", _heliDes];
	(_heliDes)
};
diag_log "<-------------Mission-------------> STAGE 3";

[["TaskSucceeded",["","Helikopter zerstören"]], "BIS_fnc_showNotification", WEST,true,false] call BIS_fnc_MP;
{	[[_x,//unit
	"RTB",//tsk title
	"Kehren sie mit den noch lebenden Piloten zur Basis zurück.",//tsk desc
	"RTB",//wptag
	true, //add tsk location?
	(getMarkerPos "Basis") //tsk location (array)
	], "SWM_fnc_createTask", _x, true, false] call BIS_fnc_MP;
}forEach _allPlayers;
[["TaskAssigned",["","RTB"]], "BIS_fnc_showNotification", WEST,true,false] call BIS_fnc_MP;
diag_log "<-------------Mission-------------> STAGE 4 Tasks set and notified";

//spawn STAGE 4 Roadblocks
[] call SWM_fnc_spawnRoadBlocks;
diag_log "<-------------Mission-------------> STAGE 4 Roadblocks spawned";

//mission victory condition===========================================================================================================================================
waitUntil {
	sleep 5;
	_distances = [_playerUnitsFlight, (getmarkerpos "Basis")] call SWM_fnc_getDistancesAliveUnits;
	diag_log format ["<-------------Mission-------------> distances to base %1", _distances];
	_countDistances = count _distances;
	((_distances select (_countDistances -1)< 150))
};

_allPilotsAlive = true;
_flightUnitCount = count _playerUnitsFlight;
for [{_i= 1},{(_flightUnitCount - _i)>=0},{_i = _i + 1}] do {
	_selector = _flightUnitCount - _i;
	if (!alive (_playerUnitsFlight select _selector)) then {_allPilotsAlive = false;};
};

if (_allPilotsAlive) then {
	["End2", "BIS_fnc_endMission", true, true] call BIS_fnc_MP;
	} else {
	["End3", "BIS_fnc_endMission", true, true] call BIS_fnc_MP;
};