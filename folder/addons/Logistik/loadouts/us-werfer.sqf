_box = _this select 0;

clearWeaponCargoGlobal _box;
clearItemCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearBackpackCargoGlobal _box;

_box addWeaponCargoGlobal ["mas_launch_M136_F",8];

_box addWeaponCargoGlobal ["mas_launch_maaws_F",2];
_box addItemCargoGlobal ["mas_MAAWS",8];

_box addWeaponCargoGlobal ["mas_launch_Stinger_F",2];
_box addItemCargoGlobal ["mas_Stinger",8];


