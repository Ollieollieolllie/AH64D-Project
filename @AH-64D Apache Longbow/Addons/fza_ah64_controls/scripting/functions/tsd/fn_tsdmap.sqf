/* ----------------------------------------------------------------------------
Function: fza_fnc_tsdMap

Description:

Parameters:

Returns:
    Nothing
    
Examples:
    [_heli] spawn fza_fnc_tsdMap;

Author:

---------------------------------------------------------------------------- */
#include "\fza_ah64_controls\headers\selections.h"
_heli = _this select 0;

private _map = getText(configFile >> "CfgWorlds" >> worldName >> "pictureMap");

fza_ah64_maplist = [_map];

_world_size = [] call BIS_fnc_mapSize;

fza_ah64_mapsizearea = _world_size;

_mapcount = count fza_ah64_maplist;

if (fza_ah64_tsdmap == _mapcount) exitwith {
    fza_ah64_tsdmap = 0;
};
fza_ah64_tsdmap = fza_ah64_tsdmap + 1;

_heli setobjecttexture [SEL_MPD_PL_OBJ1, "\fza_ah64_US\tex\mpd\ownship_ca.paa"];
_heli setobjecttexture [SEL_MPD_GR_OBJ1, "\fza_ah64_US\tex\mpd\ownship_ca.paa"];