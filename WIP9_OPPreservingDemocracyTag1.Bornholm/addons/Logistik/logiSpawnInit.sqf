LOGI_DIR = "addons\Logistik\";
publicVariable "LOGI_DIR";

if(isServer || isDedicated) then {
	private["_center", "_checkObject", "_newpos", "_box", "_heading", "_dirOffset", "_distance"];
	
	if(isNil "LOGI_CFG") then {null = [] execVM LOGI_DIR+"logiSpawnConfig.sqf"};
	
	//waitUntil{!isNil "BIS_fnc_init"};
	_center = _this select 0;
	_center allowDamage false;
	
	//spawn terminal
	_dirOffset = 265;
	_distance = 7.3;
	_newpos = [((getPos _center) select 0) + (sin ((direction  _center)+_dirOffset) * _distance),((getPos _center) select 1) + (cos ((direction  _center)+_dirOffset) * _distance),0];
	_box = "Land_CashDesk_F" createVehicle _newpos;
	_box setDir (_dirOffset + (direction _center));
	_box setName "SpawnTerminal";
	_box allowDamage false;
	
	//set spawn point 1 
	_dirOffset = 242.0;
	_distance = 2.915475947;
	logi_spawnLocation = [((getPos _center) select 0) + (sin ((direction  _center)+_dirOffset) * _distance),((getPos _center) select 1) + (cos ((direction  _center)+_dirOffset) * _distance),0];
	publicVariable "logi_spawnLocation";
	
	//set spawn point 2
	_dirOffset = 118.0;
	_distance = 2.915475947;
	logi_spawnLocation2 = [((getPos _center) select 0) + (sin ((direction  _center)+_dirOffset) * _distance),((getPos _center) select 1) + (cos ((direction  _center)+_dirOffset) * _distance),0];
	publicVariable "logi_spawnLocation2";
	
	//set spawn direction
	logi_spawnDir = (direction _center) +10;
	publicVariable "logi_spawnDir";
	
	//add spawnable items
	//[[[_box],LOGI_DIR+"logiSpawnOptions.sqf"],"BIS_fnc_execVM",west,true ] call BIS_fnc_MP;
	//use GUI instead
	[[[],LOGI_DIR+"logiSpawnConfig.sqf"],"BIS_fnc_execVM",west,true ] call BIS_fnc_MP;
	[[[_box],LOGI_DIR+"logiSpawnGUIOptions.sqf"],"BIS_fnc_execVM",west,true ] call BIS_fnc_MP;
};