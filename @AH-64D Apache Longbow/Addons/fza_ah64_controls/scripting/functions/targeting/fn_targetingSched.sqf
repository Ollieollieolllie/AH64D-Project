/* ----------------------------------------------------------------------------
Function: fza_fnc_targetingSched

Description:
	Handles repetitive target management. Should be run regularly in the scheduler.

Parameters:
	_heli - The helicopter to act on

Returns:
	Nothing

Examples:
	--- Code
    [_heli] call fza_fnc_targetingSched
	---

Author:
	Unknown
---------------------------------------------------------------------------- */
params ["_heli"];
if (!(player in _heli)) exitwith {};

if (count _visibleTargets == 0 && isNull fza_ah64_mycurrenttarget) then {
    fza_ah64_mycurrenttarget = objNull;
};
if (inputAction "vehLockTargets" > 0.5 && fza_ah64_locktargstate == 0 && count _visibleTargets > 0) then {
    if (fza_ah64_mynum >= count _visibleTargets - 1) then {
        fza_ah64_mynum = 0;
    } else {
        
        fza_ah64_mynum = fza_ah64_mynum + 1;
    };
    fza_ah64_mycurrenttarget = _visibleTargets select(fza_ah64_mynum);
    fza_ah64_locktargstate = 1;
};
if (inputAction "vehLockTargets" < 0.5 && fza_ah64_locktargstate == 1) then {
    fza_ah64_locktargstate = 0;
};
if (_heli getVariable "fza_ah64_agmode" == 2) then {
    fza_ah64_mycurrenttarget = cursortarget;
};
