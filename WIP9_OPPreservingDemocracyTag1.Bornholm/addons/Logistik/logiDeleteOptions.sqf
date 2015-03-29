private["_box", "_name"];
_box = _this select 0;
_name = _this select 1;
_box addAction ["<t color=""#ff0000"">Delete "+_name+"</t>", LOGI_DIR+"logiDelete.sqf", [_box], 1.5, true, true, "", "player distance logi_spawnLocation < 20"] ;