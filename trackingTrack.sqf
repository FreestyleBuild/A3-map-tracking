private _unit = _this select 0;

//hint str(_unit);

while {true} do
{
	private _x = (_unit getVariable "trackingData");
	_x append [[getPos _unit, getDir _unit, date, speed _unit]];
	_unit setVariable ["trackingData", _x];
	sleep ((720 / (0.01 + abs (speed _unit))) min 6);
	//hint str(_x);
};