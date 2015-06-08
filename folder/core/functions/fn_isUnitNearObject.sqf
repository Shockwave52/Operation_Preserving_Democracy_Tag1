
_unit = [_this, 0, objNull] call BIS_fnc_param; 
_obj = [_this, 1, objNull] call BIS_fnc_param; 
_dist = [_this, 2, 10] call BIS_fnc_param; 

_list = [];
_list = _unit nearEntities [_obj, _dist];

if (count _list > 0) exitWith { true };

false