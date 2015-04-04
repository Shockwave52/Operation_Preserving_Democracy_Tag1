/**
* fn_setNInfGL.sqf 
* @Descr: Ki-Rebellen loadout anpassen
* @Author: TDC | Shockwave
*
* @Arguments: -
* @Return: -
*/
private ["_unit"];

_unit = _this select 0;

//Remove existing items";
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

//Add containers";
_unit forceAddUniform "U_PMC_CombatUniformLS_ChckLB_GPBB";
_unit addItemToUniform "AGM_EarBuds";
for "_i" from 1 to 2 do {_unit addItemToUniform "AGM_Bandage";};
_unit addItemToUniform "AGM_Morphine";
_unit addItemToUniform "HandGrenade";
_unit addItemToUniform "rhs_30Rnd_545x39_AK";
_unit addItemToUniform "16Rnd_9x21_Mag";
_unit addVest "demian2435_police_belt";
_unit addItemToVest "16Rnd_9x21_Mag";
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_30Rnd_545x39_AK";};
for "_i" from 1 to 3 do {_unit addItemToVest "rhs_VOG25";};
_unit addBackpack "B_Kitbag_rgr";
for "_i" from 1 to 3 do {_unit addItemToBackpack "NVGoggles_OPFOR";};
for "_i" from 1 to 10 do {_unit addItemToBackpack "AGM_Bandage";};
for "_i" from 1 to 6 do {_unit addItemToBackpack "BWA3_DM25";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "BWA3_DM51A1";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "BWA3_DM32_Yellow";};
_unit addItemToBackpack "HandGrenade";
for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_30Rnd_545x39_AK";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_VOG25";};
_unit addHeadgear "H_Cap_red";
_unit addGoggles "rhs_scarf";

//Add weapons";
_unit addWeapon "rhs_weap_ak74m_gp25";
_unit addWeapon "hgun_Rook40_F";

//Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadioAcreFlagged";

//Set identity";
_unit setFace "GreekHead_A3_03";
_unit setSpeaker "AGM_NoVoice";
