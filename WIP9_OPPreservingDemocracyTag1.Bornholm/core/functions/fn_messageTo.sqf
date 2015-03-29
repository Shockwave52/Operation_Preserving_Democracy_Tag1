/**
 * fn_messageTo.sqf
 * @Descr: Proxy for CSE UI
 * @Author: Insane
 *
 * @Arguments: [unit, headline, text]
 * @Return: -
 * @Example: [player, "Test", ["Text text"]] call TDC_fnc_messageTo;
 */
private ["_unit","_headline","_text"];
 
[_this, _fnc_scriptName] call TDC_fnc_debug;

_unit = [_this, 0, objNull] call BIS_fnc_param;
_headline = [_this, 1, ""] call BIS_fnc_param;
_text = [_this, 2, [""]] call BIS_fnc_param;

[_unit, _headline, _text] call tdc_gui_fnc_sendDisplayInformationTo;