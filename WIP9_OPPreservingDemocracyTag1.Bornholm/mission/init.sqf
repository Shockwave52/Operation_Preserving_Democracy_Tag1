diag_log "###Mission started";

[] spawn SWM_fnc_pilotGearBox;


//adds Eventhandler for SAM Strike
_ehi = Heli addEventHandler ["HandleDamage",
{
  private ["_dmg"];
  
  if ((_this select 4) =="rhs_ammo_9k38") then
  {
    (_this select 0) setDamage 0;
    (_this select 0) setHitPointDamage ["HitHull", 0.5];
    (_this select 0) setHitPointDamage ["HitEngine",1];
    (_this select 0) setHitPointDamage ["HitEngine1",1];
    (_this select 0) setHitPointDamage ["HitEngine2",1];
    (_this select 0) setHitPointDamage ["HitHRotor", 0.4];
    (_this select 0) setHitPointDamage ["HitAvionics", 0.75];
    
    _dmg = false;
  } else 
  {
    _dmg = (_this select 0);
  };
  
  _dmg
}];


m_day1 = execVM "mission\m_day1.sqf";
