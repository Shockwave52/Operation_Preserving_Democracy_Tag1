private [];

_input = [_this, 0, ""] call BIS_fnc_param;
_return = "ERR";

switch (_input) do 
{
	case "N":
	{
		_return = localize "STR_DIR_N";
	};
	case "NE":
	{
		_return = localize "STR_DIR_NE";
	};
	case "E":
	{
		_return = localize "STR_DIR_E";
	};
	case "SE":
	{
		_return = localize "STR_DIR_SE";
	};
	case "S":
	{
		_return = localize "STR_DIR_S";
	};
	case "SW":
	{
		_return = localize "STR_DIR_SW";
	};
	case "W":
	{
		_return = localize "STR_DIR_W";
	};
	case "NW":
	{
		_return = localize "STR_DIR_NW";
	};
	default {};
};

_return
