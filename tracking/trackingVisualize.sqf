private _unit = _this select 0;

private _data = _unit getVariable "trackingData";
private _marker = _unit getVariable "trackingMarker";
private _c = 0;
private _m = "";
private _color = "ColorWhite";
private _s = 0;

private _wait = [_unit] execVM "tracking\trackingHide.sqf";

waitUntil {scriptDone _wait;};

{
	private _t = createMarkerLocal [str(_x # 0), _x # 0];
	
	_t setMarkerTypeLocal "hd_arrow";
	_t setMarkerDirLocal (_x # 1);
	
	_s = abs (_x # 3);
	
	if (_s > 0) then {_color = "ColorBlack";};
	if (_s > 5) then {_color = "ColorGrey";};
	if (_s > 15) then {_color = "ColorKhaki";};
	if (_s > 50) then {_color = "ColorGreen";};
	if (_s > 100) then {_color = "ColorYellow";};
	if (_s > 200) then {_color = "ColorOrange";};
	if (_s > 500) then {_color = "ColorRed";};
	if (_s > 700) then {_color = "ColorPink";};
	if (_s > 1000) then {_color = "ColorCIV";};
	
	_t setMarkerColorLocal _color;
	
	if (((_x # 0) # 2) > 20) then
	{
		_t setMarkerTextLocal (str((_x # 0) # 2) + " m");
	};
	
	if ((_c mod 10) == 0) then
	{
		_m = str((_x # 2) # 4);
		if (((_x # 2) # 4) < 10) then {_m = ("0" + str((_x # 2) # 4));};
		_t setMarkerTextLocal (str((_x # 2) # 3) + ":" + _m + " h");
		if (((_x # 0) # 2) > 20) then
		{
			_t setMarkerTextLocal (str((_x # 2) # 3) + ":" + _m + " h, " + str((_x # 0) # 2) + " m");
		};
	};
	_c = _c + 1;
	_marker append [_t];
}forEach _data;

_unit setVariable ["trackingMarker", _marker];