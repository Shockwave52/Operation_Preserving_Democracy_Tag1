/**
* fn_getMinDistanceBetweenUnits.sqf 
* @Descr: checks distances between given units and returns smallest distance
* @Author: TDC | Shockwave
*
* @Arguments: -
* @Return: -
*/
diag_log "<-------------minDistanceScript-------------> fired";

_unitarray1 = (_this select 0); 
_countunitarray1 = count _unitarray1;
_unitarray2 = (_this select 1);
_countunitarray2 = count _unitarray2;

if ((!(_countunitarray1>0)) or (!(_countunitarray2>0))) exitWith {
_errorDis = 10000;
diag_log "<-------------minDistanceScript-------------> error distance";
(_errorDis)};

_distances = [];

for [{_i= 1},{(_countunitarray1 - _i)>=0},{_i = _i + 1}] do {
_selector =_countunitarray1 - _i;
diag_log format ["<-------------minDistanceScript-------------> arraycount %1, selector %2", _countunitarray1, _selector];
{_d= _x distance (_unitarray1 select _selector);
_distances pushBack _d;
}forEach _unitarray2;
};
diag_log format ["<-------------minDistanceScript-------------> distances %1", _distances];

_sortedDistances = [_distances,[],{_x},"ASCEND"] call BIS_fnc_sortBy;
(_sorteddistances select 0)
