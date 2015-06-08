/**
* fn_onCuratorObjectPlaced.sqf
* @Descr: -
* @Author: Insane
*
* @Arguments: -
* @Return: -
*/
private ["_curator","_entity"];

// debug
[_this, "EVH onCuratorObjectPlaced"] call TDC_fnc_debug;

// vars
_curator = _this select 0;
_entity = _this select 1;

// fnc
tdc_curator_addObjectToCurators_server = [_entity];
publicVariableServer "tdc_curator_addObjectToCurators_server";	
