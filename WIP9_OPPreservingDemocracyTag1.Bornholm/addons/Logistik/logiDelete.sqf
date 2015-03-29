//if(local _this select 3 select 0) then {
	{
		deleteVehicle _x;
	} forEach crew (_this select 3 select 0);
	deleteVehicle (_this select 3 select 0);
//};