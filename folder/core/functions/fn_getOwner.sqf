/**
 * fn_getOwner.sqf
 * @Descr: Server side function
 * @Author: Insane
 *
 * @Arguments: Object / Unit
 * @Return: ID owner
 * @Example: -
 */
private ["_caller","_unit"];
 
// debug
[_this, _fnc_scriptName] call TDC_fnc_debug;
 
// vars
_caller = [_this, 0, objNull] call BIS_fnc_param;
_unit = [_this, 1, objNull] call BIS_fnc_param;

TDC_srv_response = owner _unit;

(owner _caller) publicVariableClient "TDC_srv_response";