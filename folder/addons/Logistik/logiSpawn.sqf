
private["_name", "_script","_param", "_cfg", "_box", "_loc", "_nearSpawn", "_heading", "_newpos"];

_param = _this;//select 3

//collision detection
_nearSpawn = logi_spawnLocation nearEntities [["All"], 3];
_nearSpawnSub = logi_spawnLocation nearEntities [["Animal"], 3];
_nearSpawn = _nearSpawn - _nearSpawnSub;

_box = _param select 0;
_name = _param select 1;

if(isNil "_name") then {_name = getText(configFile >> "cfgVehicles" >> _box >> "displayName")};
	
if(count _nearSpawn == 0) then {
	//spawn
	_box = createVehicle [_box, [0,0,1000], [], 0, "NONE"];
	if(isNil "_box") exitWith { cutText ["Item konnte nicht gefunden werden.","PLAIN",2]};
	[[[_box, _name],LOGI_DIR+"logiDeleteOptions.sqf"],"BIS_fnc_execVM",west,true ] call BIS_fnc_MP;
	_box setDir logi_spawnDir;
	_box setPos logi_spawnLocation;
	[_box, false] call AGM_Drag_fnc_makeDraggable;
	if(getNumber(configFile >> "CfgVehicles" >> typeOf _box >> "isUav")==1) then { createVehicleCrew _box; };
	if (count _param >= 3) then {null = [_box] execVM LOGI_DIR+"loadouts\"+(_param select 2)};
} else {
	_nearSpawn = logi_spawnLocation2 nearEntities [["All"], 3];
	_nearSpawnSub = logi_spawnLocation nearEntities [["Animal"], 3];
	_nearSpawn = _nearSpawn - _nearSpawnSub;

	if(count _nearSpawn == 0) then {
		//spawn alternate position
		_box = createVehicle [_box, [0,0,1000], [], 0, "NONE"];
		if(isNil "_box") exitWith { cutText ["Item konnte nicht gefunden werden.","PLAIN",2]};
		[[[_box, _name],LOGI_DIR+"logiDeleteOptions.sqf"],"BIS_fnc_execVM",west,true ] call BIS_fnc_MP;
		_box setDir logi_spawnDir;
		_box setPos logi_spawnLocation2;
		[_box, false] call AGM_Drag_fnc_makeDraggable;
		if(getNumber(configFile >> "CfgVehicles" >> typeOf _box >> "isUav")==1) then { createVehicleCrew _box; };
		if (count _param >= 3) then {null = [_box] execVM LOGI_DIR+"loadouts\"+(_param select 2)};
	} else {
		cutText ["Ein anderes Objekt blockiert den Spawn.","PLAIN",2];
	};
};