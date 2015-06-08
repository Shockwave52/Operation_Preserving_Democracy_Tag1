if !(typeName TDC_defaultChar == "ARRAY") exitWith {};

removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;

_uniform = TDC_defaultChar select 0;
_vest = TDC_defaultChar select 1;
_backpack = TDC_defaultChar select 2;
_weapon = TDC_defaultChar select 3;
_secweapon = TDC_defaultChar select 4;
_handgun = TDC_defaultChar select 5;
_headgear = TDC_defaultChar select 6;
_goggles = TDC_defaultChar select 7;
_items = TDC_defaultChar select 8;

if (typeName _uniform == "STRING") then { removeUniform player; player forceAddUniform _uniform; }
else { if (typeName _uniform == "ARRAY") then 
{
	if (_uniform select 0) then // Remove?
	{
		removeUniform player;
	};
	if (typeName (_uniform select 1) == "STRING") then
	{
		player forceAddUniform (_uniform select 1);
	};
}; };

if (typeName _vest == "STRING") then { removeVest player; player addVest _vest; }
else { if (typeName _vest == "ARRAY") then 
{
	if (_vest select 0) then // Remove?
	{
		removeVest player;
	};
	if (typeName (_vest select 1) == "STRING") then
	{
		player addVest (_vest select 1);
	};
}; };

if (typeName _backpack == "STRING") then { removeBackpack player; player addBackpack _backpack; }
else { if (typeName _backpack == "ARRAY") then 
{
	if (_backpack select 0) then // Remove?
	{
		removeBackpack player;
	};
	if (typeName (_backpack select 1) == "STRING") then
	{
		player addBackpack (_backpack select 1);
	};
}; };

if (typeName _headgear == "STRING") then { removeHeadgear player; player addHeadgear _headgear; }
else { if (typeName _headgear == "ARRAY") then 
{
	if (_headgear select 0) then // Remove?
	{
		removeHeadgear player;
	};
	if (typeName (_headgear select 1) == "STRING") then
	{
		player addHeadgear (_headgear select 1);
	};
}; };

if (typeName _goggles == "STRING") then { removeGoggles player; player addGoggles _goggles; }
else { if (typeName _goggles == "ARRAY") then 
{
	if (_goggles select 0) then // Remove?
	{
		removeGoggles player;
	};
	if (typeName (_goggles select 1) == "STRING") then
	{
		player addGoggles (_goggles select 1);
	};
}; };

// Items
{
	if (isClass (configFile >> "CfgMagazines" >> (_x select 0))) then 
	{
		player addMagazine (_x select 0);
    }
	else
	{
		if (_x select 1) then {
			player addItem (_x select 0);
			player assignItem (_x select 0);
		} else
		{
			player addItem (_x select 0);			
		};		
    };
} foreach _items;

// Primaerwaffe
if (typeName _weapon == "ARRAY") then
{
	{
		player addWeapon (_weapon select 0);
		{
			player addPrimaryWeaponItem _x;
		} foreach (_weapon select 1);
	} foreach _weapon;
};

// Sekundaerwaffe
if (typeName _secweapon == "ARRAY") then
{
	{
		player addWeapon (_secweapon select 0);
		{
			player addSecondaryWeaponItem _x;
		} foreach (_secweapon select 1);
	} foreach _secweapon;
};

// Handwaffe
if (typeName _handgun == "ARRAY") then
{
	{
		player addWeapon (_handgun select 0);
		{
			player addHandgunItem _x;
		} foreach (_handgun select 1);
	} foreach _handgun;
};

true