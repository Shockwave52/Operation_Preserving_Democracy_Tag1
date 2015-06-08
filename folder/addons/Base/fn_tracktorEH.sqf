/**
 * fn_tracktorEH.sqf
 * @Descr: EH call
 * @Author: Insane
 *
 * @Arguments: [vehicle,position,unit]
 * @Return: -
 * @Example: this addEventHandler ["GetIn", Base_fnc_tracktorEH]
 */
private ["_vehicle","_pos","_unit"];

//params
_vehicle = [_this, 0, objNull] call BIS_fnc_param;
_pos = [_this, 1, ""] call BIS_fnc_param;
_unit = [_this, 2, objNull] call BIS_fnc_param;

//validation
if (_unit != player) exitWith {};

//debug
[_this, _fnc_scriptName] spawn TDC_fnc_debug;

//code
if (_pos != "driver") exitWith {};
[_vehicle] spawn Base_fnc_tracktorInit;

//ret
true