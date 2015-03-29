private["_index", "_item"];
_index = _this select 0;
_item = LOGI_CUR_CFG select _index;
_item execVM (LOGI_DIR+"logiSpawn.sqf");