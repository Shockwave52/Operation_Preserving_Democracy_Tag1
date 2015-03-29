diag_log "### Server initialisation started ###";

// Config & Funktionen
[] call compile PreprocessFileLineNumbers "core\config.sqf";

// Scripte
_safeZone = [TDC_baseProt] spawn Base_fnc_safeZone;
//[1000,-1,true,100,1000,1000] execVM "addons\tdc_caching\main.sqf"
_handleCivs = [] execVM "addons\cos\cosInit.sqf";
_null = [] execVM "mission\init.sqf";

waitUntil 
{
	sleep 0.1; 
	(scriptDone _handleCivs)
};

TDC_serverCompleted = true;
publicVariable "TDC_serverCompleted";
diag_log "### Server initialisation completed ###";