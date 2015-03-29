/**
* fn_addCurator.sqf 	(server-side only)
* @Descr: erlaubt dem Spieler, Zeus zu nutzen
* @Author: Insane
*
* @Arguments: -
* @Return: -
*/
private ["_unit","_freeCurator","_exit"];

// server side only
if !(isServer) exitWith{};

// debug
[_this, _fnc_scriptName] call TDC_fnc_debug;

// vars
_unit = [_this, 0, 0] call BIS_fnc_param;
_exit = false;


// fnc
// freien Curator suchen
{
	if !alive(getAssignedCuratorUnit _x) then { unassignCurator _x; };	// aufräumen
	
	if ((getAssignedCuratorUnit _x) == _unit) exitWith { _exit = true; };	// ist bereits Curator	
	if (isNull(getAssignedCuratorUnit _x)) exitWith { _freeCurator = _x; };
} forEach allCurators;

if _exit exitWith {false};

if !(isNil "_freeCurator") then 
{
	_unit assignCurator _freeCurator;
	_freeCurator addCuratorAddons TDC_zeusAddons;
	
	[_unit, "Zeus", [format["Du bist nun Zeus %1", _freeCurator]]] call TDC_fnc_messageTo;
	[format["%1 ist nun Zeus %2", _unit, _freeCurator], _fnc_scriptName] call TDC_fnc_debug;
} else
{
	[_unit, "Zeus", ["Konnte Zeus nicht zuweisen, Plätze sind voll"]] call TDC_fnc_messageTo;
};

true