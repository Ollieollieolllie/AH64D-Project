/* ----------------------------------------------------------------------------
Function: fza_fnc_Gdoortoggle

Description:

Parameters:

Returns:
    Nothing
    
Examples:
    [_heli] spawn fza_fnc_Gdoortoggle;
    statement="[this] spawn fza_fnc_Gdoortoggle";

Author:

---------------------------------------------------------------------------- */
_heli = _this select 0;

if (_heli animationphase "gdoor" < 0.5) then {
    _heli animate["gdoor", 1];
    playsound "fza_ah64_rh_dooropen1";
};
if (_heli animationphase "gdoor" > 0.5) then {
    _heli animate["gdoor", 0];
    waituntil {
        (_heli animationphase "gdoor" < 0.1)
    };
    playsound "fza_ah64_rh_doorclose1";
};