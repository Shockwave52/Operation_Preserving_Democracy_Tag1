/**
 * fn_debug.sqf
 * @Descr: -
 * @Author: Insane
 *
 * @Arguments: [msg, scriptname]
 * @Return: -
 * @Example: [_this, _fnc_scriptName] call TDC_fnc_debug;
 */

_msg = [_this, 0, ""] call BIS_fnc_param;
_scriptname = [_this, 1, ""] call BIS_fnc_param;

if (isNil "DEBUGGING") exitWith{ diag_log format["	##Debug## %1  >>  %2", _scriptname, _msg]; };
if (!DEBUGGING) exitWith{false};

if (!isNil "DEBUGGING_INGAME") then { if (DEBUGGING_INGAME) then { format["%1  >>  %2", _scriptname, _msg] call BIS_fnc_error; }; };

diag_log format["	## TDC Debug ##   %1  >>  %2", _scriptname, _msg];
true