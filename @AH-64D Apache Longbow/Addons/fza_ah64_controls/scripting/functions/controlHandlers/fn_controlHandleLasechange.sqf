/* ----------------------------------------------------------------------------
Function: fza_fnc_controlHandlelasechange

Description:
	switch between remote lase and self lase

Parameters:
	_heli - The heli

Returns:
	Nothing

Examples:
	--- Code
    [_heli] call fza_fnc_controlHandlelasechange
	---

Author:
	Unknown
---------------------------------------------------------------------------- */
//Switch missile lase
params ["_heli"];

_lases = ((listRemoteTargets west) apply {_x # 0}) select {_x isKindOf "LaserTargetBase"};
if (count _lases == 0) then {
	systemChat "No lases available";
	_heli setVariable ["fza_ah64_currentLase", objNull, true];
	_heli setVariable ["fza_ah64_currentSkippedLases", [], true];
} else {
	_diff = _lases - (_heli getVariable "fza_ah64_currentSkippedLases");
	_helilase = laserTarget _heli;
	if !(isNull laserTarget _heli) then {
		//self lase part
		_heli setVariable ["fza_ah64_currentLase", _helilase # 0, true];
		_heli setVariable ["fza_ah64_currentSkippedLases", (_heli getVariable "fza_ah64_currentSkippedLases") + [_helilase # 0], true];
	} else {
		//self lase part
		_heli setVariable ["fza_ah64_currentLase", _lases # 0, true];
		_heli setVariable ["fza_ah64_currentSkippedLases", (_heli getVariable "fza_ah64_currentSkippedLases") + [_lases # 0], true];
	};
};

_lase = _heli getVariable "fza_ah64_currentLase";
if !(isNull _lase) then {
	systemChat format ["%1 %2", ["REMOTE", "LOCAL"] select (laserTarget _heli == _lase), mapGridPosition _lase]
};


/*
params ["_heli"];

_lases = ((listRemoteTargets west) apply {_x # 0}) select {_x isKindOf "LaserTargetBase"};
if (count _lases == 0) then {
	systemChat "No lases available";
	_heli setVariable ["fza_ah64_currentLase", objNull, true];
	_heli setVariable ["fza_ah64_currentSkippedLases", [], true];
} else {
	_diff = _lases - (_heli getVariable "fza_ah64_currentSkippedLases");
	if (count _diff == 0) then {
		_heli setVariable ["fza_ah64_currentLase", _lases # 0, true];
		_heli setVariable ["fza_ah64_currentSkippedLases", [_lases # 0], true];
	} else {
		_heli setVariable ["fza_ah64_currentLase", _lases # 0, true];
		_heli setVariable ["fza_ah64_currentSkippedLases", (_heli getVariable "fza_ah64_currentSkippedLases") + [_lases # 0], true];
	};
};

_lase = _heli getVariable "fza_ah64_currentLase";
if !(isNull _lase) then {
	systemChat format ["%1 %2", ["REMOTE", "LOCAL"] select (laserTarget _heli == _lase), mapGridPosition _lase]
};