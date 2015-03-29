/**
* fn_heliCrashFailSafe.sqf 
* @Descr: sets Dammage to Helicopter after time even if SAM doesnt hit
* @Author: TDC | Shockwave
*
* @Arguments: -
* @Return: -
*/
diag_log "SWM_fnc_heliCrashFailSafe ausgeführt";

sleep 3;
Heli setDamage 0; 
Heli setHitPointDamage ["HitHull", 0.5];
Heli setHitPointDamage ["HitEngine",1];
Heli setHitPointDamage ["HitEngine1",1];
Heli setHitPointDamage ["HitEngine2",1];
Heli setHitPointDamage ["HitHRotor", 0.4];
Heli setHitPointDamage ["HitAvionics", 0.75];
