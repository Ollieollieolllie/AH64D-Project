/* ----------------------------------------------------------------------------
Function: fza_fnc_controlHandleASEAutopage

Description:
	Switches the helicopter between different ASE autopage settings (Off, Launch, Track)

Parameters:
	_heli - The apache helicopter to change the autopage setting for.

Returns:
	Nothing

Examples:
	--- Code
    [_heli] call fza_fnc_controlHandleASEAutopage
	---

Author:
	Unknown
---------------------------------------------------------------------------- */
params ["_heli"];

switch(fza_ah64_aseautopage) do {
	case 0: {
		fza_ah64_aseautopage = 1;
	};
	case 1: {
		fza_ah64_aseautopage = 2;
	};
	case 2: {
		fza_ah64_aseautopage = 0;
	};
};