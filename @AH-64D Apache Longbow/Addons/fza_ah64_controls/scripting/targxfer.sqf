/*_heli = _this select 0;
//if(local _heli) then
//{
fza_ah64_pfzcache = [(name player), "all", ((_heli getVariable "fza_ah64_pfzs") select (_heli getVariable "fza_ah64_pfz_count")), time];
publicvariable "fza_ah64_pfzcache";
_heli vehiclechat "Targets uploaded.";
//};