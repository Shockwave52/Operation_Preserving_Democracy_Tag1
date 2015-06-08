/**
* fn_getDistancesAliveUnits.sqf 
* @Descr: returns array of distances from given location to each given unit that is alive
* @Author: TDC | Shockwave
*
* @Arguments: -
* @Return: Array with sorted Distances from smallest to biggest
*/
diag_log "<-------------getDistancesAliveUnits-------------> fired";

private ["_unitArray", "_aliveUnitsArray", "_loc", "_distances"];

_unitArray = (_this select 0);
_aliveUnitsArray = [];
_loc = (_this select 1);
_distances = [];

//checks if unit is alive -> if yes, it gets added to the aliveunitsarray
{if ((!isNull _x) && (alive _x)) then 
    {
        _aliveUnitsArray pushBack _x;
    };    
}forEach _unitArray;

if ((count _unitArray)== 0) exitWith {
	_allDeadErrorDis = [10000];
	diag_log "<-------------getDistancesAliveUnits-------------> error, all units dead";
	(_allDeadErrorDis)
}; 

{_d= _x distance _loc;
_distances pushBack _d;
}forEach _aliveUnitsArray;

_sortedDistances = [_distances,[],{_x},"ASCEND"] call BIS_fnc_sortBy;

_sortedDistances