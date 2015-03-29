["Client initialisation started", "INIT"] spawn TDC_fnc_debug;

waitUntil {!isNull player && player == player};
0 cutText["Server lädt..","BLACK FADED"];
0 cutFadeOut 9999999;

enableSaving [false, false];
enableTeamswitch false;
enableSentences false;

// Config & Funktionen
[] call compile PreprocessFileLineNumbers "core\config.sqf";

// Skripte
_evh = [] spawn TDC_fnc_eventHandlers;					// Eventhandler laden
_insignias = [] spawn TDC_fnc_unitInsignia;				// Rangabzeichen Units
//_igiload = [] spawn Igi_fnc_IgiLoadInit;				// IgiLoad laden
_defaultGear = [] spawn TDC_fnc_setDefaultGear;			//defaultgear

// 3rd party scripts
if (TDC_enableIgiLoad) then { _igiload = execVM "addons\IgiLoad\IgiLoadInit.sqf"; };

// Loading Screen
waitUntil 
{ 
	sleep 0.1; 
	((scriptDone _evh && scriptDone _insignias) && (!isNil "TDC_serverCompleted"))
};
0 cutText["","BLACK FADED"];
0 cutFadeOut 3;

TDC_clientCompleted = true;
["Client initialisation completed", "INIT"] spawn TDC_fnc_debug;