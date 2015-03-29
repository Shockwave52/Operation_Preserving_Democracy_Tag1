/**
 * fn_respawnVehicle.sqf
 * @Descr: because BIS cant "respawn" init. of vehicles
 * @Author: Insane
 *
 * @Arguments: [vehicle, destroyed delay, "init field" (optional), init on spawn (optional)]
 * @Return: -
 * @Examples: 	waitUntil {!isNil "TDC_serverCompleted"}; _nil = [this, 1, {_this addEventHandler ["GetIn", Base_fnc_tracktorEH]}, true, true] spawn TDC_fnc_respawnVehicle; 
				_nil = [this] spawn TDC_fnc_respawnVehicle;
 */
private "_veh";

//pre check
if (!isServer) exitWith {};
waitUntil {!isNil "TDC_serverCompleted"};
[_this, _fnc_scriptName] spawn TDC_fnc_debug;

//params
_veh = [_this, 0, objNull] call BIS_fnc_param;
_delay = ([_this, 1, 15] call BIS_fnc_param) * 60;
_vehInit = [_this, 2, {}] call BIS_fnc_param;
_execNow = [_this, 3, true] call BIS_fnc_param;
_fncMP = [_this, 4, false] call BIS_fnc_param;

_dir = getDir _veh; 
_pos = getPos _veh; 
_vehtype = typeOf _veh; 
	
if (_execNow) then 
{ 
	if (_fncMP) then 
	{
		[[_veh,_vehInit], "TDC_fnc_spawn", true, true] call BIS_fnc_MP;
	} else 
	{
		_veh spawn _vehInit; 
	};
	[format["init of %1: %2",_veh,_vehInit], _fnc_scriptName] spawn TDC_fnc_debug;
};
	
while {true} Do {
    sleep 1;		
    if (!alive _veh) then {
        for "_i" from 0 to _delay do {  
            sleep 1;  
        };
            
        deleteVehicle _veh;
        sleep 1;
        _veh = createVehicle [_vehtype, _pos, [], 0, "CAN_COLLIDE"];
        _veh setDir _dir;
        _veh setPos [_pos select 0, _pos select 1,0];
        _veh spawn _vehInit;
		[format["vehicle %1 spawned with init: %2",_veh,_vehInit], _fnc_scriptName] spawn TDC_fnc_debug;
    };
};
