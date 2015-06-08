class tdc_curator
{
	tag = "tdc_curator";
	class functions
	{
		file = "addons\tdc_curator";
		class init;
		class initServer;
		class addCurator;

		class onCuratorObjectPlaced;
	};
};

class A3_Modules_F_Curator
{
	class Curator
	{
		class moduleCurator
		{
			file="addons\tdc_curator\fn_moduleCurator.sqf";
		};
	};
};