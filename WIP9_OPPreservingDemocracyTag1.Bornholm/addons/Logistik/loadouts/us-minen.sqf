_box = _this select 0;

clearWeaponCargoGlobal _box;
clearItemCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearBackpackCargoGlobal _box;

_box addItemCargoGlobal ["APERSMine_Range_Mag",20];
_box addItemCargoGlobal ["ClaymoreDirectionalMine_Remote_Mag",20];
_box addItemCargoGlobal ["DemoCharge_Remote_Mag",20];
_box addItemCargoGlobal ["SLAMDirectionalMine_Wire_Mag",20];

_box addItemCargoGlobal ["AGM_Clacker",5];
_box addItemCargoGlobal ["AGM_DefusalKit",2];
_box addItemCargoGlobal ["AGM_M26_Clacker",5];
_box addItemCargoGlobal ["AGM_DeadManSwitch",5];