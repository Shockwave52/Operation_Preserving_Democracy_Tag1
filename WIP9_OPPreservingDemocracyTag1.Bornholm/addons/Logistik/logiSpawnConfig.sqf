private["_ammo", "_weap", "_veh", "_cloth", "_static", "_misc"];

if (isNil "LOGI_ammo") then 
{	
	waitUntil {!isNil "CONFIG_LOADED"};
	
	_weap = [];
	_ammo = [];
	_cloth = [];
	_veh = [];
	_static = [];
	_static set [count _static, ["Box_NATO_AmmoVeh_F", "Basisbau", "basis1.sqf"]];	
	_misc = [];
	_misc set [count _misc, ["Box_NATO_AmmoVeh_F", "Leere Kiste", "empty.sqf"]];
	_misc set [count _misc, ["B_supplyCrate_F", "Sanitätsausrüstung", "sani.sqf"]];
	_misc set [count _misc, ["B_supplyCrate_F", "Versorgungskiste", "versorgung.sqf"]];
	_misc set [count _misc, ["B_supplyCrate_F", "Funkgerate", "funk.sqf"]];
	
	switch (TDC_side) do 
	{
		case "BW":
		{						
			// WAFFEN
			_weap set [count _weap, ["B_supplyCrate_F", "Gewehre", "bw-waffen.sqf"]];
			_weap set [count _weap, ["B_supplyCrate_F", "Raketenwerfer", "bw-werfer.sqf"]];	
			// MUNITION
			_ammo set [count _ammo, ["B_supplyCrate_F", "Gewehrmunition", "bw-muni.sqf"]];
			_ammo set [count _ammo, ["B_supplyCrate_F", "Sprengstoffe", "us-minen.sqf"]];
			_ammo set [count _ammo, ["Box_NATO_AmmoVeh_F", "Fahrzeugmunition", "empty.sqf"]];			
			// Sachen
			_cloth set [count _cloth, ["B_supplyCrate_F", "Kleidung", "bw-kleidung.sqf"]];
			_cloth set [count _cloth, ["B_supplyCrate_F", "Rucksacke", "bw-ruck.sqf"]];
			_cloth set [count _cloth, ["B_supplyCrate_F", "Equipment", "bw-equip.sqf"]];			
			// Fahrzeuge
			//_veh set [count _veh, ["B_supplyCrate_F", "", ".sqf"]];		
			// Statisches	
			//_static set [count _static, ["Box_NATO_AmmoVeh_F", "Basisbau", "basis1.sqf"]];				
			// Rest
			//_misc set [count _misc, ["Box_NATO_AmmoVeh_F", "Leere Kiste", "empty.sqf"]];
		};
		
		case "US":
		{
			// WAFFEN
			_weap set [count _weap, ["B_supplyCrate_F", "Gewehre", "us-waffen.sqf"]];
			_weap set [count _weap, ["B_supplyCrate_F", "Raketenwerfer", "us-werfer.sqf"]];
			// MUNITION
			_ammo set [count _ammo, ["B_supplyCrate_F", "Gewehrmunition", "us-muni.sqf"]];
			_ammo set [count _ammo, ["B_supplyCrate_F", "Sprengstoffe", "us-minen.sqf"]];
			_ammo set [count _ammo, ["Box_NATO_AmmoVeh_F", "Fahrzeugmunition", "empty.sqf"]];
			// Sachen
			_cloth set [count _cloth, ["B_supplyCrate_F", "Schutzkleidung", "us-equip.sqf"]];
			// Fahrzeuge
			// Statisches
			// Rest
		};
		
		default {};
	};	
	
	LOGI_ammo = _ammo;
	LOGI_weap = _weap;
	LOGI_veh = _veh;
	LOGI_cloth = _cloth;
	LOGI_static = _static;
	LOGI_misc = _misc;
};
