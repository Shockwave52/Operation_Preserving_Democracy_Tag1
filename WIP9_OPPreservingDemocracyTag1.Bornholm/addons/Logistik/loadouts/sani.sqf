_box = _this select 0;

clearWeaponCargoGlobal _box;
clearItemCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearBackpackCargoGlobal _box;

_box addItemCargoGlobal ["AGM_Bandage",80];
_box addItemCargoGlobal ["AGM_Morphine",10];
_box addItemCargoGlobal ["AGM_Epipen",10];
_box addItemCargoGlobal ["AGM_Bloodbag",20];