/**
 * fn_safeZone.sqf
 * @Descr: SafeZone for Base, not the "yellow from the egg", but should work until the mods are adapted for this..
 * @Author: Insane
 *
 * @Arguments: [radius, marker,enemysides]
 * @Return: -
 * @Example: [TDC_baseProt] spawn Base_fnc_safeZone;
 */
private ["_array","_rad","_marker","_enemy","_timer"];
 
[_this, _fnc_scriptName] call TDC_fnc_debug;

_array = [_this, 0, false] call BIS_fnc_param;
if (typeName _array != "ARRAY") exitWith {};	// in cfg deaktiviert

_rad = [_array, 0, []] call BIS_fnc_param;
_marker = [_array, 1, "debugZone"] call BIS_fnc_param;
_enemy = [_array, 2, []] call BIS_fnc_param;
_timer = [_array, 3, 30] call BIS_fnc_param;

while {isNil "skipSafeZones"} do 
{
	sleep _timer;
	_debug = [];
	_list = (getMarkerPos _marker) nearEntities ["Man", _rad];
	
	{
		if ((side _x in _enemy) && !(_x getVariable ["ignoreSafeZone", false])) then 
		{ 
			_debug pushBack _x;
			_x setDamage 1; 
			deleteVehicle _x; 
		}; 
	} foreach _list;
	
	[format["Cleared base zone: %1", _debug],"safeZone"] call TDC_fnc_debug;		
};