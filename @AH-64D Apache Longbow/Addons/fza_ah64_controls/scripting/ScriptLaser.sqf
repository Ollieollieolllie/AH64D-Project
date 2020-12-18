/*_heli = _this select 0;
hint str {started};
private _gunner = gunner _heli;

if(fza_ah64_laserstate == 1 && {player isEqualTo _gunner}) then
{
	private _ah64laser = objNull;
	_ah64laser = "LaserTargetW" createvehicle [0,0,0];
	(group _gunner) reveal _ah64laser;

	if(cameraView isEqualTo "GUNNER") then
	{
		private _heliPos	= getPosASLVisual _heli;
		private _targetPos	= AGLToASL screenToWorld [0.5,0.5];
		private _objislist	= lineIntersectsSurfaces [_heliPos, _targetPos, _heli, _ah64laser];

		if(_objislist isEqualTo []) then
		{
			// If there is no intersection try to use cursorObject - otherwise use screen pos
			// Quite useful when object is beyond 5000m limit of lineIntersectsSurfaces command
			if(!isnull cursorObject)then
			{
				_targetPos = aimPos cursorObject;
			};
		} else {
			// Use position of first intersection
			_targetPos = ((_objislist # 0) # 0);
			// Adding small offset - sometimes intersection with geometry might be behind visual LOD
			_targetPos = _targetPos vectorDiff ((_heliPos vectorFromTo _targetPos) vectorMultiply 0.05);
		};
		_ah64laser setPosASL _targetPos;
	};
} else {
	{
		if(local _x || isNull _x) exitwith
		{
			fza_ah64_desiglist = fza_ah64_desiglist - [_x];
			publicvariable "fza_ah64_desiglist";
		};
	} foreach fza_ah64_desiglist;
};