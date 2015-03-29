class Logispawn_dialog
{
	idd=-1;
	movingenable=true;
	
	class controls 
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Astavinu, v1.063, #Towodi)
		////////////////////////////////////////////////////////

		class frmBG: tdc_gui_backgroundBase
		 {
			idc = 1800;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.3639375 * safezoneW;
			h = 0.355 * safezoneH;
		};
		class txtTitle: tdc_gui_staticBase
		{
			idc = 1106;
			text = "<t size='3'>Logistik</t>"; //--- ToDo: Localize;
			colorBackground[] = {0.8,0.6,0,1}; 
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.3639375 * safezoneW;
			h = 0.033 * safezoneH;
		};
		/* Top Menu Bar
		class btnMenu1: tdc_gui_buttonBase
		{
			idc = 1600;
			text = "Menu 1";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class btnMenu2: tdc_gui_buttonBase
		{
			idc = 1601;
			text = "Menu 2";
			x = 0.365937 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class btnMenu3: tdc_gui_buttonBase
		{
			idc = 1602;
			text = "Menu 3";
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class btnMenu4: tdc_gui_buttonBase
		{
			idc = 1603;
			text = "Menu 4";
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class btnMenu5: tdc_gui_buttonBase
		{
			idc = 1604;
			text = "Menu 5";
			x = 0.5825 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.044 * safezoneH;
		};*/
		class btnOpt1: tdc_gui_buttonBase
		{
			idc = 1605;
			text = "Select"; //--- ToDo: Localize;
			action = "closeDialog 0; null = [""ammo""] execVM (LOGI_DIR + ""logiSpawnListItems.sqf"");";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class btnOpt2: tdc_gui_buttonBase
		{
			idc = 1606;
			text = "Select"; //--- ToDo: Localize;
			action = "closeDialog 0; null = [""weap""] execVM (LOGI_DIR + ""logiSpawnListItems.sqf"");";
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class btnOpt3: tdc_gui_buttonBase
		{
			idc = 1607;
			text = "Select"; //--- ToDo: Localize;
			action = "closeDialog 0; null = [""cloth""] execVM (LOGI_DIR + ""logiSpawnListItems.sqf"");";
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class btnOpt4: tdc_gui_buttonBase
		{
			idc = 1608;
			text = "Select"; //--- ToDo: Localize;
			action = "closeDialog 0; null = [""veh""] execVM (LOGI_DIR + ""logiSpawnListItems.sqf"");";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class btnOpt5: tdc_gui_buttonBase
		{
			idc = 1609;
			text = "Select"; //--- ToDo: Localize;
			action = "closeDialog 0; null = [""static""] execVM (LOGI_DIR + ""logiSpawnListItems.sqf"");";
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class btnOpt6: tdc_gui_buttonBase
		{
			idc = 1610;
			text = "Select"; //--- ToDo: Localize;
			action = "closeDialog 0; null = [""misc""] execVM (LOGI_DIR + ""logiSpawnListItems.sqf"");";
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class txtOpt1: tdc_gui_staticBase
		{
			idc = 1100;
			text="Munition";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.088 * safezoneH;
		};
		class txtOpt2: tdc_gui_staticBase
		{
			idc = 1101;
			text="Waffen";
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.088 * safezoneH;
		};
		class txtOpt3: tdc_gui_staticBase
		{
			idc = 1102;
			text="Equip";
			x = 0.541249 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.088 * safezoneH;
		};
		class txtOpt4: tdc_gui_staticBase
		{
			idc = 1103;
			text="Fahrzeuge";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.088 * safezoneH;
		};
		class txtOpt5: tdc_gui_staticBase
		{
			idc = 1104;
			text="Statisch";
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.088 * safezoneH;
		};
		class txtOpt6: tdc_gui_staticBase
		{
			idc = 1105;
			text="Andere";
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.088 * safezoneH;
		};
	};
};
class Logispawn_list_dialog
{
	idd=-1;
	movingenable=true;
	
	class controls 
	{
		class frmBG: tdc_gui_backgroundBase
		 {
			idc = 1800;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.3639375 * safezoneW;
			h = 0.355 * safezoneH;
		};
		class txtTitle: tdc_gui_staticBase
		{
			idc = 1106;
			text = "<t size='3'>Spawn</t>"; //--- ToDo: Localize;
			colorBackground[] = {0.8,0.6,0,1}; 
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.3639375 * safezoneW;
			h = 0.033 * safezoneH;
		};
		
		class listItems: tdc_gui_listBoxBase {
			idc = 1500;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.280086 * safezoneH + safezoneY;
			w = 0.3639375 * safezoneW;
			h = 0.236841 * safezoneH;
			
			class VScrollbar {
				color[] = {1, 1, 1, 1};
				width = 0.021;
				autoScrollSpeed = -1;
				autoScrollDelay = 5;
				autoScrollRewind = 0;
			};
			
			class HScrollbar {
				color[] = {1, 1, 1, 1};
				height = 0.028;
			};
			
			class ListScrollBar {
				color[] = {1,1,1,0.6};
				colorActive[] = {1,1,1,1};
				colorDisabled[] = {1,1,1,0.3};
				thumb = "\ca\ui\data\igui_scrollbar_thumb_ca.paa";
				arrowFull = "\ca\ui\data\igui_arrow_top_active_ca.paa";
				arrowEmpty = "\ca\ui\data\igui_arrow_top_ca.paa";
				border = "\ca\ui\data\igui_border_scroll_ca.paa";
			};
		};
		class btnOpt4: tdc_gui_buttonBase
		{
			idc = 1608;
			text = "Zuruck"; //--- ToDo: Localize;
			action = "closeDialog 0; null = createDialog ""Logispawn_dialog""";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class btnOpt6: tdc_gui_buttonBase
		{
			idc = 1610;
			text = "Spawn"; //--- ToDo: Localize;
			action = "null = [lbCurSel 1500] execVM (LOGI_DIR+""logiSpawnAdapter.sqf"");closeDialog 0; ";
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.044 * safezoneH;
		};
	};
};