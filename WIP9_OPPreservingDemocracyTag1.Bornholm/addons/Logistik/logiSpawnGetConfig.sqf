waitUntil {!isNil "LOGI_misc"};

switch(_this select 0) do {
	case "ammo":{LOGI_CUR_CFG = LOGI_ammo};
	case "weap":{LOGI_CUR_CFG = LOGI_weap};
	case "cloth":{LOGI_CUR_CFG = LOGI_cloth};
	case "veh":{LOGI_CUR_CFG = LOGI_veh};
	case "static":{LOGI_CUR_CFG = LOGI_static};
	case "misc":{LOGI_CUR_CFG = LOGI_misc};
};