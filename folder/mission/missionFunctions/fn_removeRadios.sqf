/**
* fn_removeRadios.sqf 
* @Descr: removes Radios from player -> execute player
* @Author: TDC | Shockwave
*
* @Arguments: -
* @Return: -
*/

{Player removeItem _x;} forEach ([]call acre_api_fnc_getCurrentRadioList);