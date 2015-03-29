/**
* fn_init.sqf 
* @Descr: Zeus Modul init
* @Author: Insane
*
* @Arguments: -
* @Return: -
*/
//private [];

// debug
[_this, _fnc_scriptName] call TDC_fnc_debug;


// fnc
if ((getPlayerUID player) in TDC_zeusPlayers) then 
{
	[[player], "tdc_curator_fnc_addCurator", false] call BIS_fnc_MP;
	
	{    
		_x addEventHandler ["CuratorGroupPlaced",{[_this,"tdc_curator_fnc_onCuratorObjectPlaced",false] spawn BIS_fnc_MP}];
		_x addEventHandler ["CuratorObjectPlaced",{[_this,"tdc_curator_fnc_onCuratorObjectPlaced",false] spawn BIS_fnc_MP}];
	} forEach allCurators; 
};
