private _unit = _this select 0;

private _marker = _unit getVariable "trackingMarker";

{
	deleteMarkerLocal _x;
}forEach _marker;

_unit setVariable ["trackingMarker", _marker];