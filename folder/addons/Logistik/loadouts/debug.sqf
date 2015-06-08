
private["_box"];
_box = _this select 0;

clearWeaponCargoGlobal _box;
clearItemCargoGlobal _box;
clearMagazineCargoGlobal _box;
//_loc = [(spawnLocation select 0) + 3, spawnLocation select 1, spawnLocation select 2];
logiBox = _box;
publicVariable "logiBox";
_box addAction ["move [0]+1", { LogiBox setPos [((getPos LogiBox) select 0) +0.5, ( getPos LogiBox) select 1, (getPos LogiBox) select 2];}];
_box addAction ["move [0]-1", { LogiBox setPos [((getPos LogiBox) select 0) -0.5, (getPos LogiBox) select 1, (getPos LogiBox) select 2];}];
_box addAction ["move [1]+1", { LogiBox setPos [(getPos LogiBox) select 0, ((getPos LogiBox) select 1)+0.5, ((getPos LogiBox) select 2)];}];
_box addAction ["move [1]-1", { LogiBox setPos [(getPos LogiBox) select 0, ((getPos LogiBox) select 1)-0.5, ((getPos LogiBox) select 2)];}];
_box addAction ["reset position", { LogiBox setPos logi_spawnLocation;}];