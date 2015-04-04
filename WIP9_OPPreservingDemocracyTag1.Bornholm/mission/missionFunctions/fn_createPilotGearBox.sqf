_box = "Box_NATO_Wps_F" createVehicle (getMarkerPos "pilots_gear");

clearWeaponCargoGlobal _box;
clearItemCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearBackpackCargoGlobal _box;

_box addItemCargoGlobal ["AGM_EarBuds",2];
_box addItemCargoGlobal ["AGM_MapTools",2];

_box addItemCargoGlobal ["H_PilotHelmetHeli_B",2];

//weapons 
_box addWeaponCargoGlobal ["BWA3_MP7",2];
_box addItemCargoGlobal ["BWA3_optic_Aimpoint",2];
_box addItemCargoGlobal ["BWA3_acc_LLM01_flash",2];
_box addMagazineCargoGlobal ["BWA3_40Rnd_46x30_MP7",8];

//Grenades
_box addMagazineCargoGlobal ["AGM_HandFlare_Green",2];
_box addMagazineCargoGlobal ["BWA3_DM25",2];
_box addMagazineCargoGlobal ["SmokeShellBlue",4];
_box addMagazineCargoGlobal ["BWA3_DM32_Orange",2];
_box addMagazineCargoGlobal ["BWA3_DM32_Yellow",2];

_box addBackpackCargoGlobal ["BWA3_Kitbag_Fliegerfaust",2];
_box addItemCargoGlobal ["ACRE_PRC117F",2];

_box addItemCargoGlobal ["AGM_Bandage",20];
_box addItemCargoGlobal ["AGM_Morphine",4];
_box addItemCargoGlobal ["AGM_Epipen",4];