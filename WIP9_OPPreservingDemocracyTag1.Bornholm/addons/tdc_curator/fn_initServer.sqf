/**
* fn_initServer.sqf 	(server-side only)
* @Descr: -
* @Author: Insane
*
* @Arguments: -
* @Return: -
*/
private ["_evh"];

// server side only
if !(isServer) exitWith{};

// debug
[_this, _fnc_scriptName] call TDC_fnc_debug;

// fnc
"tdc_curator_addObjectToCurators_server" addPublicVariableEventHandler 
{ 
	[_this, _fnc_scriptName] call TDC_fnc_debug;
	private ["_var"];
	_var = if (typeName _this == "GROUP") then {units(_this select 1)} else {(_this select 1)};
	
	{
		_x addCuratorEditableObjects [_var, true];
	} forEach allCurators;
};

