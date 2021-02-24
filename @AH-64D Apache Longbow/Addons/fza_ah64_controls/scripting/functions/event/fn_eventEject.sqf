/* ----------------------------------------------------------------------------
Function: fza_fnc_eventeject

Description:
    Event handler that finishes parts of apache logic when someone gets out.

    Closes HUD UI

Parameters:
    _heli - the helicopter to modify

Returns:
	Nothing

Examples:

Author:
	unknown
---------------------------------------------------------------------------- */
params["_heli"];


moveout player;
/*
[_heli, "tailboom"] execvm "\fza_ah64_controls\scripting\damage\dam_debris.sqf";
deletevehicle _heli;

//failed attempts to kick gunner from bird
/*
_gunner = gunner _heli;
moveout _gunner;
moveout gunner _heli;