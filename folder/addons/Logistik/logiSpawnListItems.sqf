_handle = [_this select 0] execVM (LOGI_DIR+"logiSpawnGetConfig.sqf");waitUntil { scriptDone _handle};

private["_handle","_name", "_x", "_i"];

lbClear 1500;
spawnDialog = createDialog "Logispawn_list_dialog";

for [{ _i = 0},{ count LOGI_CUR_CFG > _i},{ _i = _i +1 }] do {
	_x = LOGI_CUR_CFG select _i;
	
	if (count _x < 2) then {
		_name = getText(configFile >> "cfgVehicles" >> _x select 0 >> "displayName");
	} else {
		_name = _x select 1;
	};
	
	lbAdd [1500, _name];
	lbSetData[1500, _i, _i];
};