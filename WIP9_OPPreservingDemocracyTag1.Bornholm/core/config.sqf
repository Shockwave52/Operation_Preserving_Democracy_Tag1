// =========================
//   Einfache Einstellungen
// =========================
// Debugging
DEBUGGING = true;
DEBUGGING_INGAME = false;

// Skripte
TDC_enableInsigniasModule = true;							// Insignias aktiv: true / false
TDC_enableIgiLoad = true;									// IgiLoad aktiv ja oder nein (true/false)
TDC_baseProt = [1000, "base_m", [EAST], 10];				// Basis Schutz vor KI: Range, Marker, Feind [EAST,IND], Wiederholungstimer
TDC_enableCivModule = true;								// Zivilisten-Skript: true / false

// Logistik	
TDC_side = "BW";											// Logistik System Template: BW, US	

// Default Gear, Deaktivieren: TDC_defaultChar = false; -- veraendern siehe config-helper.txt
TDC_defaultChar = [false,false,[true,false],false,false,false,[true,false],[true,false],[["ItemMap",true],["ItemCompass",true],["ItemWatch",true]]];

// Spieler, die Zeus nutzen koennen (Z), Array von UID's
TDC_zeusPlayers = [
  "76561198033445663",
  "76561198034272715",
  "76561197984087020",
  "76561198046589953",
  "76561198046688617"     // Truppenkasper
];										


// ==================================================
//   Einstellungen fuer erfahrenere Missionsdesigner
// ==================================================
// Zivilisten
COScivPool = ["C_man_1","C_man_1_1_F","C_man_1_2_F","C_man_1_3_F","C_man_hunter_1_F","C_man_p_beggar_F","C_man_p_beggar_F_afro","C_man_p_fugitive_F","C_man_p_shorts_1_F","C_man_polo_1_F","C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_6_F","C_man_shorts_1_F","C_man_shorts_2_F","C_man_shorts_3_F","C_man_shorts_4_F","C_man_w_worker_F"];	
COSmotPool = ["C_Hatchback_01_F","C_Hatchback_01_sport_F","C_Offroad_01_F","C_SUV_01_F","C_Van_01_box_F","C_Van_01_fuel_F","C_Van_01_transport_F"];
whiteListMkrs = [];											// Marker. Whitelist mit zu bevoelkernden Staedten, z.B ["stadt1","stadt4","stadt2"]

// Bausystem / EDN
//edn_fortification_array = edn_fortification_array + [Displayname, Typename, path to picture,[[classname, number],[classname, number],[...]],toolkit true/false,crate true/false]
edn_fortification_array = [
	["BagFence Corner","Land_BagFence_Corner_F","\edn_fortification\images\Land_BagFence_Corner_F.paa",[["edn_sandbag",3,"Sandbag"]],false,false],
	["BagFence End","Land_BagFence_End_F","\edn_fortification\images\Land_BagFence_End_F.paa",[["edn_sandbag",2,"Sandbag"]],false,false],
	["BagFence Long","Land_BagFence_Long_F","\edn_fortification\images\Land_BagFence_Long_F.paa",[["edn_sandbag",5,"Sandbag"]],false,false],
	["BagFence Round","Land_BagFence_Round_F","\edn_fortification\images\Land_BagFence_Round_F.paa",[["edn_sandbag",5,"Sandbag"]],false,false],
	["BagFence Short","Land_BagFence_Short_F","\edn_fortification\images\Land_BagFence_Short_F.paa",[["edn_sandbag",3,"Sandbag"]],false,false],
	["Razor wire","Land_Razorwire_F","\edn_fortification\images\Land_Razorwire_F.paa",[["edn_Wirecoil",5,"Wire Coil"]],false,false],
	["Camonet NATO","CamoNet_BLUFOR_F","\edn_fortification\images\CamoNet_BLUFOR_F.paa",[["edn_camonet",2,"Camonet"],["edn_Metalpipe",5,"Aluminium pipe"]],false,false],
	["BagFence Bunker","Land_BagBunker_Small_F","\edn_fortification\images\Land_BagBunker_Small_F.paa",[["edn_sandbag",9,"Sandbag"],["edn_Woodplank",3,"Wooden plank"]],true,true],
	["Camping Table","Land_CampingTable_F","\edn_fortification\images\Land_CampingTable_F.paa",[["edn_Metalpipe",2,"Aluminium pipe"],["edn_Steelplate",1,"Steelplate"]],true,false],
	["Camping Table Small","Land_CampingTable_Small_F","\edn_fortification\images\Land_CampingTable_Small_F.paa",[["edn_Metalpipe",1,"Aluminium pipe"],["edn_Steelplate",1,"Steelplate"]],true,false],
	["Camping Chair","Land_CampingChair_V2_F","\edn_fortification\images\Land_CampingChair_V2_F.paa",[["edn_Metalpipe",2,"Aluminium pipe"]],true,false]
];

SWM_aiSkill = 0.25;
SWM_missionTriggerVariable = false;
SWM_samLocs = ["sam1", "sam2", "sam3"];


//form: [["markername","vehilceType", vehicleDirection]]
SWM_roadblockMarkersVeh = [
["s1Block1veh1_dir280", "C_Hatchback_01_F", 280],
["s1Block1veh2_dir180", "C_SUV_01_F", 180],
["s1Block2veh1_dir180", "C_SUV_01_F", 180],
["s2Block1veh2_dir0", "C_Hatchback_01_F", 0],
["s1Block3veh1_dir0", "C_Hatchback_01_F", 0],
["s1Block3veh2_dir180", "C_SUV_01_F", 180],
["s1Block3veh3_dir0", "C_Hatchback_01_F", 0],
["s2Block1veh1_dir0", "C_Hatchback_01_F", 0],
["s2Block2veh1_dir330", "C_SUV_01_F", 330],
["s2Block2veh2_dir40", "C_SUV_01_F", 40],
["s3Block1veh1_dir90", "C_Hatchback_01_F", 90],
["s3Block1veh2_dir0", "C_SUV_01_F", 0],
["s3Block2veh1_dir90", "C_SUV_01_F", 90],
["s3Block2veh2_dir0", "C_Hatchback_01_F", 0]
];

SWM_roadblockMarkersInf = [
["s1Block1Inf1", "light"],
["s1Block1Inf2", "light"],
["s1Block2Inf1", "light"],
["s1Block3Inf1", "light"],
["s1Block3Inf2", "heavy"],
["s2Block1Inf1", "light"],
["s2Block1Inf2", "heavy"],
["s2Block2inf1", "light"],
["s2Block2inf2", "heavy"],
["s3Block1inf1", "light"],
["s3Block1inf2", "light"],
["s3Block2inf1", "light"],
["s3Block2inf2", "heavy"]
];

SWM_roadblockMarkersOffroads = [
"s1Block2veho",
"s2Block2veho",
"s3Block1veho"
];

TDC_zeusAddons = activatedAddons;			// alternativ kann ein Array von cfgPatches definiert werden

TDC_serverAdmin = (serverCommandAvailable "#kick");
TDC_lastmsg = time;
TDC_srv_response = nil;

CONFIG_LOADED = true;
true