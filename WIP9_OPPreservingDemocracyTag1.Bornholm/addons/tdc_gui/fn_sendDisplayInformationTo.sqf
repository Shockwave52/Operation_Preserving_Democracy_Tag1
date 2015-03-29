/**
* fn_senDisplayInformationTo.sqf 
* @Descr: -
* @Author: Insane, Glowbal
*
* @Arguments: receiver OBJECT, title STRING, content ARRAY (An array with strings), type NUMBER (Optional)
* @Return: -
*/  
private ["_reciever","_title","_content","_type", "_parameters", "_localizationArray"];

// debug
[_this, _fnc_scriptName] call TDC_fnc_debug;

// params
_reciever = [_this, 0, ObjNull,[ObjNull]] call BIS_fnc_Param;
_title = [_this, 1, "",[""]] call BIS_fnc_Param;
_content =  [_this, 2, [""],[[""]]] call BIS_fnc_Param;
_type =  [_this, 3, 0,[0]] call BIS_fnc_Param;
_parameters = [_this, 4, [], [[]]] call BIS_fnc_Param;


// fnc
if (isPlayer _reciever) then {
	if (!local _reciever) then {
		[_this, "tdc_gui_fnc_displayInformation", _reciever, false] spawn BIS_fnc_MP;
	} else {

		if (isLocalized _title) then {
			_title = localize _title;
		};
		_localizationArray = [_title];
		{
			_localizationArray pushback _x;
		}foreach _parameters;
		_title = format _localizationArray;

		{
			if (isLocalized _x) then 
			{
				_localizationArray = [localize _x];
				{
					_localizationArray pushback _x;
				} foreach _parameters;

				_content set [_foreachIndex, format _localizationArray];
			};
		} foreach _content;

		[_title,_content,_type] call tdc_gui_fnc_displayInformation;
	};
};