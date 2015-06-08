private["_name","_box", "_x"];
_box = _this select 0;
waitUntil {!isNil "LOGI_CFG"};
for [{ _i = 0},{ count LOGI_CFG > _i},{ _i = _i +1 }] do {
	_x = LOGI_CFG select _i;
	
	if (count _x < 2) then {
		_name = getText(configFile >> "cfgVehicles" >> _x select 0 >> "displayName")
	} else {
		_name = _x select 1;
	};
	
	_script = {_x select 2 };
	if(isNil "_script") then {
		_box addAction ["<t color=""#00c136"">Spawn "+_name+"</t>", LOGI_DIR+"logiSpawn.sqf", [_x select 0, _name]];
	} else {
		_box addAction ["<t color=""#00c136"">Spawn "+_name+"</t>", LOGI_DIR+"logiSpawn.sqf", [_x select 0, _name, _x select 2]];
	};
};