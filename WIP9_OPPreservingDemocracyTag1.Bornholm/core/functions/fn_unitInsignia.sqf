/**
 * fn_unitInsignia.sqf
 * @Descr: -
 * @Author: Insane
 *
 * @Arguments: [unit (optional), custom (optional)]
 * @Return: -
 * @Example: [player, "tdc_Leutnant"] spawn TDC_fnc_unitInsignia;
 */
private ["_unit","_insignia","_rankArr"];
 
[_this, _fnc_scriptName] call TDC_fnc_debug;

if !TDC_enableInsigniasModule exitWith {};
 
_unit = [_this, 0, player] call BIS_fnc_param;
_insignia = [_this, 1, false] call BIS_fnc_param;
 
if (typeName _insignia == "BOOL") then 
{
	_rankArr = [];
	{
		if (_x == 46) exitWith {};
		_rankArr set [count _rankArr, _x];
	} foreach (toArray name _unit);
	
	switch (toString _rankArr) do 
	{
		case "OLt": {
			_insignia = "tdc_Oberleutnant";
		};
		case "Lt": {
			_insignia = "tdc_Leutnant";
		};
		case "StFw": {
			_insignia = "tdc_Stabsfeldwebel";
		};
		case "HptFw": {
			_insignia = "tdc_Hauptfeldwebel";
		};
		case "Fw": {
			_insignia = "tdc_Feldwebel";
		};
		case "Uffz": {
			_insignia = "tdc_Unteroffizier";
		};
		case "OStGefr": {
			_insignia = "tdc_Oberstabsgefreiter";
		};
		case "StGefr": {
			_insignia = "tdc_Stabsgefreiter";
		};
		case "HptGefr": {
			_insignia = "tdc_Hauptgefreiter";
		};
		case "OGefr": {
			_insignia = "tdc_Obergefreiter";
		};
		case "Gefr": {
			_insignia = "tdc_Gefreiter";
		};
		default {
			_insignia = "tdc_Gefreiter"
		}
	};
};
//[player,"tdc_Leutnant"] spawn BIS_fnc_setUnitInsignia;
[[_unit,_insignia], "BIS_fnc_setUnitInsignia", true, true] call BIS_fnc_MP;
true