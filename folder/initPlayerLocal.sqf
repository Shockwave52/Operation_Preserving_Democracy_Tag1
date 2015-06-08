//SWM briefing for players
player createDiaryRecord ["Diary",["Intel",
"Laut dänischen Angaben sind die BIS nur leicht bewaffnet und sind meist in Civil-Kleidung unterwegs. Allerdings besteht die Möglichkeit das sie nach dem Angriff auf den Außenposten in Besitz von schultergestützten Waffen und schweren MG's gekommen sind. Die Städte <font color=""#00FFFF""><marker name=""aakirkeby"">Aakirkeby</marker>, <marker name=""vestermarie"">Vestermarie</marker></font> und <font color=""#00FFFF""><marker name=""klemensker"">Klemensker</marker></font> gelten als Rebellenzentren.<br />
Zusätzlich wurde die Bornholm'sche Bevölkerung vom Dummheitsvirus befallen. Autofahrer die gegen Wände fahren und somit einen Feuerball kreieren sind also keine Seltenheit."
]];

player createDiaryRecord ["Diary",["Missionsregeln",
"Die NATO-Führung hat für die derzeitige Situation Angriffs- und Missionsregeln gestellt: <br />
- Zivilisten sollen beschützt werden und sollen unter keinen Umständen Schaden durch NATO-Kampfhandlungen erleiden.<br />
- Rebellen dürfen nur Angegriffen werden wenn sie eine Gefahr für Zivilisten oder NATO-Einheiten darstellen.<br />
- Tödliche Gewalt darf nur bei einem Angriff und zur Verteidigung benutzt werden.<br />
- Die non-verbale Identifizierung von NATO-Einheiten geschehen mit blauen Rauch, verbal lautet die Frage ""Was war's Letzte?"" und die Antwort ""Sauerkirschen"".<br />
- NATO-Einheiten sowie Ausrüstung jeglicher Art dürfen nicht im Feld zurückgelassen werden, sodass die Rebellen nicht in Besitz fortschritllicher Technik kommen. Im Zweifel muss das Objekt zerstört werden."
]];

player createDiaryRecord ["Diary",["Mission",
"Die deutsche Delegation wurde von der NATO-Führung abkommandiert am ersten Tag der Operation 'Preserving Democracy' eine 'Quick Reaction Force' zu stellen. Sie soll sich bereit halten um schnell auf eventuelle Missionen reagieren zu können. Ebenfalls soll sie einen Patrouillenflug stellen.<br />
Bereitschaft beginnt um 10:00. Der Patrouillenflug startet um 10:02 und fliegt entlang der auf der Karte markierten Wegpunkte <font color=""#00FFFF""><marker name=""wp1"">HeliWP1</marker>, <marker name=""wp2"">HeliWP2</marker>, <marker name=""wp3"">HeliWP3</marker>, <marker name=""wp4"">HeliWP4</marker>, <marker name=""wp5"">HeliWP5</marker></font> und <font color=""#00FFFF""><marker name=""wp6"">HeliWP6</marker></font>. Genutzt wird eine 'Westland Lynx' Rufzeichen 'Eagle'. 'Eagle' wird mit der QRF, Rufzeichen 'Weasel', auf dem Kanal 1 des 'PRC-117f'  in Verbindung bleiben und Statuspdates sowie Situationreports geben.<br />
Leider steht unser NH-90 kaputt im Hangar. Uns stehen somit bis zur Ankunft von weiterer Ausrüstung und Fahrzeugen nur die guten alten Dingos und Fenneks zur Verfügung.<br />
Die <font color=""#00FFFF""><marker name=""Logistik"">Logistik</marker></font> war so nett und hat für die QRF und die Piloten bereits jeweils eine Kiste zum ausrüsten ins Logistikzentrum gestellt. Sonderwünschen müssen am Logistiktresen bestellt werden."
]];

player createDiaryRecord ["Diary",["Situation",
"Schon seit einiger Zeit kämpfen Rebellen für die Unabhängigkeit von Bornholm. Sie nennen sich selbst das 'Bornholm Independence Syndicate' oder kurz BIS. Die Bewegung stößt innerhalb der Bevölkerung auf Missverständnis und die Mehrheit ist gegen eine Unabhängigkeit. Nachdem die Diplomatie gescheitert ist, haben die BIS einen Dänischen Außenposten angegriffen und ausgeraubt. Mit weiterer Gewalt ist also zu rechnen, weshalb die dänische Regierung die NATO um Hilfe gebeten hat. So entstand 'Operation 'Preserving Democracy''. Die jeweiligen Delegationen von Deutschland, England und der USA werden auf dem <font color=""#00FFFF""><marker name=""Basis"">Flughafen von Roenne</marker></font> stationiert, der von der dänischen Armee zur Verfügung gestellt wurde. Die Bundeswehr ist die erste Delegation die am Roenne Flughafen ankommt."
]];

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

// SWM samStrike Eventhandler, adds Eventhandler for SAM Strike
_ehi = Heli addEventHandler ["HandleDamage",
{
  private ["_dmg"];
  
  if ((_this select 4) =="rhs_ammo_9k38") then
  {
    [true] call SWM_fnc_samStrike;
  };  
}];

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