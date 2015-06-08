_box = _this select 0;

clearWeaponCargoGlobal _box;
clearItemCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearBackpackCargoGlobal _box;

_box addBackpackCargoGlobal ["BWA3_AssaultPack_Medic",3];
_box addBackpackCargoGlobal ["BWA3_Kitbag_Fliegerfaust",8];
_box addBackpackCargoGlobal ["B_Parachute",8];

_box addBackpackCargoGlobal ["B_UAV_01_backpack_F",2];