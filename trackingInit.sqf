private _unit = _this select 0;

//hint str(_unit);

_unit setVariable ["trackingData", [[getPos _unit, getDir _unit, date, speed _unit]]];
_unit setVariable ["trackingMarker", []];  


_unit addAction ["<t color='#00FF00'>Show Tracking Data </t>",{[_this # 1] execVM "tracking\trackingVisualize.sqf";}]; 
_unit addAction ["<t color='#FF0000'>Hide Tracking Data</t>",{[_this # 1] execVM "tracking\trackingHide.sqf";}];


[_unit] execVM "tracking\trackingTrack.sqf";