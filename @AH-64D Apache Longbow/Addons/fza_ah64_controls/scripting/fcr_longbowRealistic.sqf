/*//Deleted stuff that wasn't actually used and fixed the ownship appearing on the FCR... - Brad

#define AGMODE_GND 0
#define AGMODE_AIR 1
#define AGMODE_FNI 2 //FCR Not Installed (FNI)

if (!(isNil "fza_ah64_nofcr")) exitwith {};
_heli = objNull;
_targetArray = [];
_detectchance = 0.00834;
_adaunit = false;
_datalinkArray = [];

while {
    (time > -1)
}
do {
    waituntil {
        (vehicle player) iskindof "fza_ah64base"
    };

    _heli = vehicle player;

    waitUntil {
        ((driver(vehicle player) == player || gunner(vehicle player) == player) && isengineon(vehicle player))
    };

    if (isVehicleRadarOn _heli && (typeOf _heli == "fza_ah64d_b2e") && !("fza_ah64_fcr_fail" in (_heli magazinesturret[-1]))) then {
		
        _datalinkArray = listRemoteTargets west;
        {
            _targetArray pushback(_x select 0);
        }
        foreach _datalinkArray;

        {
            if (alive _x && !(_x in fza_ah64_targetlist)) then {
                _i = _x;
                _adaunit = false; {
                    if (_i iskindof _x) then {
                        _adaunit = true;
                    };
                }
                foreach fza_ah64_ada_units;

                //In theory, this should hide the player helicopter...
                if (_i == _heli) then {
                    _targetArray = _targetArray - [_i];
                };

                if (_i distance _heli > 10000 || (_i iskindof "man") || !(alive _i)) then {
                    _targetArray = _targetArray - [_i];
                };

                //If what is detected isn't any of the items below, remove it from the list...
                if (!(_i isKindOf "helicopter" || _i isKindOf "plane" || _i isKindOf "car" || _i isKindOf "tank" || _i isKindOf "ship" || _i isKindOf "Staticweapon" || _adaunit)) then {
                    _targetArray = _targetArray - [_i];
                };
                sleep 0.03;
            };
        }
        foreach _targetArray;

        {
            if (!(_x in fza_ah64_targetlist)) then {
                fza_ah64_targetlist = fza_ah64_targetlist + [_x];
                _heli reveal _x;
            };
        }
        foreach _targetArray; {
            if (!(_x in fza_ah64_fcrlist)) then {
                fza_ah64_fcrlist = fza_ah64_fcrlist + [_x];
            };
        }
        foreach _targetArray;
    };
    sleep 2;
};