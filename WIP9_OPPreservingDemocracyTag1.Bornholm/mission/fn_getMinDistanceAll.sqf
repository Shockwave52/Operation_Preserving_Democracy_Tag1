/**
* fn_getMinDistanceAll.sqf 
* @Descr: checks distances from each ORF unit to each flight unit in mission if they are controlled by a player. if not distance is set to 10000. Returns value of smallest distance
* @Author: TDC | Shockwave
*
* @Arguments: -
* @Return: -
*/
_distances = [];

//distance QRF to Pilot
{
if((isPlayer _x) and (isPlayer Pilot)) then 
{private "_x";
_d= _x distance Pilot;
_distances pushBack _d;
} 
else
{
_d =10000;
_distances pushBack _d;
};
} forEach SWM_QRFUnits;

//distance QRF to WSO
{private "_x";
if((isPlayer _x) and (isPlayer WSO)) then
{
_d= _x distance WSO;
_distances pushBack _d;
} 
else
{
_d =10000;
_distances pushBack _d;
}; 
} forEach SWM_QRFUnits;

_sortedDistances = [_distances,[],{_x},"ASCEND"] call BIS_fnc_sortBy;

(_sorteddistances select 0)