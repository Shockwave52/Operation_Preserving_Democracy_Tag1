/**
 * fn_tracktorStart.sqf
 * @Descr: -
 * @Author: idk(initialisation) + Shockwave(adaptation) + Insane(revision)
 *
 * @Arguments: [towing vehicle, target]
 * @Return: -
 * @Example: [vehicle player, vehicle_32] spawn Base_fnc_tracktorStart;
 */
private[];
 
//debug
[_this, _fnc_scriptName] spawn TDC_fnc_debug;

//pre check
if not (local player) exitWith {};

//params
_Tractor = [_this, 0, objNull] call BIS_fnc_param;
_cargo = [_this, 3, objNull] call BIS_fnc_param;

//config
_cargoName = getText(configFile >> "CfgVehicles" >> typeOf _cargo >> "DisplayName");

//code
_Tractor removeAction TOWING_actioncargo;
if( (isNull _cargo) || ((_cargo distance _Tractor) > 20) ) then {
	Tractorcargo = 0;
	exit;
};

//role role role the rope..
_dist1 = (_Tractor distance _cargo) + 1; // Toleranz
_skip = false;
//msg
[player, "Rangierfahrzeug", [format["Hänge %1 an...", _cargoName],"nicht bewegen!"]] spawn TDC_fnc_messageTo;
//waiiiit
_WipTime = 0;
while {_WipTime<=5} do {
	if ((_Tractor distance _cargo) > _dist1) exitWith {_skip = true};
	sleep 1;
	_WipTime = _WipTime+1;
};
if (_skip) exitWith 
{ 
	[player, "Rangierfahrzeug", "Aktion abgebrochen"] spawn TDC_fnc_messageTo; 
	Tractorcargo = 0;
};

Tractorcargo = 1;
TOWING_actiondrop = _Tractor addAction [format ["Detach %1", _cargoName], Base_fnc_tracktorStop, _cargo];
_cargo engineOn false;

//msg
[player, "Rangierfahrzeug", format["%1 wurde angehangen", _cargoName]] spawn TDC_fnc_messageTo;

_CargoDis = _cargo distance _Tractor;
_CargoDamage = GetDammage _cargo;
while{ (Tractorcargo == 1) && (alive _Tractor) && (vehicle player == _Tractor)} do
{
	_TractorPos = getPosASL _Tractor;
	_TractorDir = getDir _Tractor;
	_cargo setPosASL [(_TractorPos select 0) + (_CargoDis * sin _TractorDir), (_TractorPos select 1) + (_CargoDis * cos _TractorDir), (_TractorPos select 2)];
	_cargo setDir (_TractorDir + 180);
	_cargo SetDammage _CargoDamage;		
	sleep 0.01;
};
_Tractor removeAction TOWING_actiondrop;
_TractorPos = getPosASL _Tractor;
_TractorDir = getDir _Tractor;
_cargo setPosASL [(_TractorPos select 0) + (_CargoDis * sin _TractorDir), (_TractorPos select 1) + (_CargoDis * cos _TractorDir), (_TractorPos select 2)];
_cargo setDir (_TractorDir + 180);
_cargo SetDammage _cargoDamage;

//msg
[player, "Rangierfahrzeug", format["%1 wurde abgehangen", _cargoName]] spawn TDC_fnc_messageTo;