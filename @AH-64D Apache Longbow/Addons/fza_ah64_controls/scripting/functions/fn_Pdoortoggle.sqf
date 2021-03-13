/* ----------------------------------------------------------------------------
Function: fza_fnc_Pdoortoggle

Description:

Parameters:

Returns:
    Nothing
    
Examples:
    [_heli] spawn fza_fnc_Pdoortoggle;
    statement="[this] spawn fza_fnc_Pdoortoggle";

Author:

---------------------------------------------------------------------------- */
_heli = _this select 0;

if (_heli animationphase "pdoor" < 0.5) then {
    _heli animate["pdoor", 1];
    playsound "fza_ah64_rh_dooropen1";
};
if (_heli animationphase "pdoor" > 0.5) then {
    _heli animate["pdoor", 0];
    waituntil {
        (_heli animationphase "pdoor" < 0.1)
    };
    playsound "fza_ah64_rh_doorclose1";
};