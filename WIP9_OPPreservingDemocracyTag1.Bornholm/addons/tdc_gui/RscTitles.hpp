class TDC_DISPLAY_INFORMATION 
{
	duration = 15;
	idd = 86412;
	movingenable = 0;
	onLoad = "uiNamespace setVariable ['TDC_DISPLAY_INFORMATION', _this select 0];";
	fadein = 0;
	
	class controlsBackground 
	{
		class header: tdc_gui_staticBase 
		{
			idc = 1;
			type = CT_STATIC;
			x = "safezoneX + (safezoneW / 10)";
			y = "safezoneY + (6 * (safeZoneH / 40))";
			w = "(safeZoneW / 10)";
			h = "(safeZoneH / 40)";
			style = ST_LEFT;
			font = FontTDC;
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			colorText[] = {0.85, 0.85, 0.85, 1.0};
			colorBackground[] = {0, 0, 0, 0.9};
			text = "";
		};
		class text: header 
		{
			idc = 2;
			y = "safezoneY + (7.1 * (safeZoneH / 40))";
			w = "(safeZoneW / 10) * 1.3";
			colorText[] = {0.0, 0.0, 0.0, 1.0};
			colorBackground[] = {1, 1, 1, 0.9};
			text = "";
		};
		class text2: text 
		{
			idc = 3;
			y = "safezoneY + (8.2 * (safeZoneH / 40))";
		};
		class text3: text 
		{
			idc = 4;
			y = "safezoneY + (9.3 * (safeZoneH / 40))";
		};
		class text4: text 
		{
			idc = 5;
			y = "safezoneY + (10.4 * (safeZoneH / 40))";
		};
		class text5: text 
		{
			idc = 6;
			y = "safezoneY + (11.5 * (safeZoneH / 40))";
		};

		class icon: tdc_gui_backgroundBase 
		{
			type = CT_STATIC;
			idc = 10;
			style = ST_PICTURE;
			colorBackground[] = {0,0,0,1};
			colorText[] = {1, 1, 1, 1};
			font = FontTDC;
			text = "";
			sizeEx = 0.032;
			x = "safezoneX + (safezoneW / 10)";
			y = "safezoneY + (4 * (safeZoneH / 40))";
			w = "(safeZoneH / 40)*2";
			h = "(safeZoneH / 40)*2";
			};
		};
};