/* ----------------------------------------------------------------------------
Function: fza_fnc_AseFlaredeploy

Description:
    deploys flare if ir jam enables on ase

Parameters:
    _heli - The helicopter that fired it
    _munition - Missile
    _hostile - is it hostile

Returns:
	

Examples:

Author:
	ollieollieolllie
---------------------------------------------------------------------------- */

params ["_heli","_munition","_hostile"];

if !(player == driver _heli) exitwith {};
if(!(_munition isKindOf "missileBase") || !(isengineon _heli || (alive _heli))) exitwith {};

_missile = nearestobject [_hostile,_munition];

{
    if (_hostile iskindof _x && _heli getVariable "fza_ah64_irjstate" == 1 && _heli getVariable "fza_ah64_irjon" == 0 ) then {
        _irjammerscript = [_heli] execvm "\fza_ah64_controls\scripting\ir_jammer.sqf";
    };
}
foreach fza_ah64_ada_units;

////Reduces the missiles 2 cores to 1 activation
_fza_ah64_incominghandled2 = _hostile getVariable ["fza_ah64_shotCounter2", 0];
_hostile setVariable ["fza_ah64_shotCounter2", (_fza_ah64_incominghandled2 + 1) % 2];
if (_fza_ah64_incominghandled2 % 2 == 1) exitWith {};

////ASE PAGE LINK////
waitUntil {((_heli getVariable "fza_ah64_irjstate" == 1) || (_heli getVariable "fza_ah64_irjon" == 1) || !(alive _missile))};
if !(alive _missile) exitwith {};
////ASE PAGE LINK END////

//1st action is deploying flares incase the ecm cant jam in time
[vehicle player, "fza_CMFlareLauncher", [-1]] call BIS_fnc_fire;
sleep 1;
[vehicle player, "fza_CMFlareLauncher", [-1]] call BIS_fnc_fire;

_flarecount = 0;
while {(_flarecount < 3) && (alive _heli)} do {
	sleep 4;
	[vehicle player, "fza_CMFlareLauncher", [-1]] call BIS_fnc_fire;
	_flarecount = _flarecount + 1;
};

//kill jammer after script
if (_heli getVariable "fza_ah64_irjstate" == 1) then {_heli setVariable ["fza_ah64_irjon", 0, true];};

sleep 15;
fza_ah64_threatfiring = fza_ah64_threatfiring - [_hostile];