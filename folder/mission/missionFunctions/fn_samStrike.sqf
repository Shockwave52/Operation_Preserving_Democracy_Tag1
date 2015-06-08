/**
* fn_samStrike.sqf 
* @Descr: sets Dammage to Helicopter to simulate SAM-Strike
* @Author: TDC | Shockwave
*
* @Arguments: -
* @Return: -
*/
diag_log "<-------------SAM-Strike.sqf-------------> fired";

_realShot = (_this select 0); //false if no actual missile was fired

if (!_realShot) then {
	Heli vehicleChat "Missile Inbound";
	sleep 2;
	diag_log "<-------------SAM-Strike.sqf-------------> message sent";
};

Heli setDamage 0; 
Heli setHitPointDamage ["HitHull", 0.5];
Heli setHitPointDamage ["HitEngine",1];
Heli setHitPointDamage ["HitEngine1",1];
Heli setHitPointDamage ["HitEngine2",1];
Heli setHitPointDamage ["HitHRotor", 0.4];
Heli setHitPointDamage ["HitAvionics", 0.75];

diag_log "<-------------SAM-Strike.sqf-------------> damage set.";

missionNamespace setVariable ["SWM_HeliHit", true]; 
publicVariableServer "SWM_HeliHit";
diag_log  format ["<-------------SAM-Strike.sqf-------------> public variable HeliHit set to %1", (missionNamespace getVariable "SWM_HeliHit")];
