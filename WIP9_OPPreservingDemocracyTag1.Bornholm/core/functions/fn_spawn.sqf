/**
 * fn_spawn.sqf
 * @Descr: -
 * @Author: Insane
 *
 * @Arguments: [unit, code]
 * @Return: -
 * @Example: [player, {hint "ys"}] spawn TDC_fnc_spawn;
 */
 
_unit = [_this, 0, objNull] call BIS_fnc_param;
_code = [_this, 1, ""] call BIS_fnc_param;
 
[_this, _fnc_scriptName] spawn TDC_fnc_debug; 
_unit spawn _code; 
 
true