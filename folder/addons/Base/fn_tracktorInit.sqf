/**
 * fn_tracktorInit.sqf
 * @Descr: -
 * @Author: idk(initialisation) + Shockwave(adaptation) + Insane(revision)
 *
 * @Arguments: [towing vehicle]
 * @Return: -
 * @Example: [vehicle player] spawn Base_fnc_tracktorInit;
 */
private ["_Tractor","_actionadded","_cargo"];
 
//debug
[_this, _fnc_scriptName] spawn TDC_fnc_debug;
 
//params
_Tractor = [_this, 0, objNull] call BIS_fnc_param;

//config, defines
Tractorcargo = 0;
_actionadded = 0;
_cargo = objNull;

//init msg
[player, "Rangierfahrzeug", ["Direkt vor Flugobjekt stellen","Aktionsmenü betätigen"]] call TDC_fnc_messageTo;


while{ (alive _Tractor) && ((driver _Tractor) == player) } do 
{
	if (Tractorcargo == 0) then 
	{
		_nObject = nearestObject [_Tractor, "Air"];
		if not (isNull _nObject) then 
		{
			if ((_nObject distance _Tractor) > 20) then 
			{
				if (!isNil "TOWING_actioncargo") then { _Tractor removeAction TOWING_actioncargo; };
				_actionadded = 0;

				_TractorPos = getPosASL _Tractor;
				//hint format ["Position: x= %1, y= %2, z= %3.", (_TractorPos select 0), (_TractorPos select 1), (_TractorPos select 2)];
				//sleep 2;
			}
			else
			{
				if((_nObject != _cargo) && (_actionadded == 1)) then
				{
					if (!isNil "TOWING_actioncargo") then { _Tractor removeAction TOWING_actioncargo; };
					_actionadded = 0;
				};
				_TractorPos = getPosASL _Tractor;
				_TractorDir = getDir _Tractor;
				_CargoPos = getPosASL _nObject;
				_CargoDir = getDir _nObject;
				_TractorHeading = (((_TractorPos select 0) - (_CargoPos select 0)) atan2 ((_TractorPos select 1) - (_CargoPos select 1)));
				_TractorBearing = _TractorHeading - _CargoDir;
				if(_TractorBearing  > 180) then
				{
					_TractorBearing  = _TractorBearing  - 360;
				}else{
					if(_TractorBearing  < -180) then
					{
						_TractorBearing  = _TractorBearing  + 360;
					}
				};
				_CargoHeading = (((_CargoPos select 0) - (_TractorPos select 0)) atan2 ((_CargoPos select 1) - (_TractorPos select 1)));
				_CargoBearing = _CargoHeading - _TractorDir;
				if(_CargoBearing > 180) then
				{
					_CargoBearing = _CargoBearing - 360;
				}else{
					if(_CargoBearing < -180) then
					{
						_CargoBearing = _CargoBearing + 360;
					}
				};
				if( ((_TractorBearing  > -5) && (_TractorBearing  < 5)) && ((_CargoBearing  > -5) && (_CargoBearing  < 5)) && (_actionadded == 0) ) then
				{
					_actionadded = 1;
					_cargo = _nObject;
					_cargoName = getText(configFile >> "CfgVehicles" >> typeOf _cargo >> "DisplayName");
					TOWING_actioncargo = _Tractor addAction [format ["%1 abschleppen", _cargoName], Base_fnc_tracktorStart, _cargo];
					
				};
			};
		};
	}
	else
	{
		_Tractor removeAction TOWING_actioncargo;
		_actionadded = 0;
	};
	sleep 0.1;
};
if (!isNil "TOWING_actioncargo") then {_Tractor removeAction TOWING_actioncargo; };
if (!isNil "TOWING_actiondrop") then {_Tractor removeAction TOWING_actiondrop; };