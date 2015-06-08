/**
 * fn_trackObject.sqf
 * @Descr: -
 * @Author: Insane
 *
 * @Arguments: [OBJECT object, INT freq (optional), BOOL deleteDead (optional)]
 * @Return: -
 * @Example: [this, 5, false] spawn TDC_fnc_trackObject;
 */
private ["_obj","_freq","_del","_fnc_cond","_marker"];
 
// debug 
[_this, _fnc_scriptName] call TDC_fnc_debug;


// vars
_obj = [_this, 0, objNull] call BIS_fnc_param;
_freq = [_this, 1, 3] call BIS_fnc_param;
_del = [_this, 2, true] call BIS_fnc_param;


// functions
_fnc_marker =
{
	private ["_pos","_color","_name","_m"];
	_pos = _this select 0;
	_color = _this select 1;
	_name = _this select 2;	
	_m = createMarker [format["mPos%1%2",(floor(_pos select 0)),(floor(_pos select 1))],_pos];
	_m setmarkerColor _color;
	_m setMarkerShape "Icon";
	_m setMarkerType "mil_dot";
	_m setMarkerText format["%1", _name];	
	_m
};


// function itself :P
if (_del) then
{
	_fnc_cond = {(alive _this)};
} else
{
	_fnc_cond = {true};
};

while {[_obj] call _fnc_cond} do 
{
	if !(isNil "_marker") then { deleteMarker _marker;};
	_marker = [getPos _obj, "ColorBlue", str(_obj)] call _fnc_marker;		
	sleep _freq;
};