_box = _this select 0;

clearWeaponCargoGlobal _box;
clearItemCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearBackpackCargoGlobal _box;

_box addMagazineCargoGlobal ["30Rnd_556x45_Stanag",60];
_box addMagazineCargoGlobal ["1Rnd_HE_Grenade_shell",15];

// M24
_box addMagazineCargoGlobal ["5Rnd_mas_762x51_Stanag",15];

// M9
_box addMagazineCargoGlobal ["RH_15Rnd_9x19_M9",20];