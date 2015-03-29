private ["_pos","_m"];

if (!DEBUGGING) exitWith {};
 
_pos = _this select 0;
_m = createMarker [format["mPos%1%2",(floor(_pos select 0)),(floor(_pos select 1))],_pos];
_m setmarkerColor (_this select 1);
_m setMarkerShape "Icon";
_m setMarkerType "mil_dot";

_m