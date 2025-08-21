// structureGrab.sqf

STG_grabStructure = {
    params ["_pos", "_radius"];

    private _pos = _this select 0;
    private _radius = _this select 1;

    [_pos, _radius, true] call BIS_fnc_objectsGrabber;
};


private _plyPos = getPos player;

[_plyPos, 35] call STG_grabStructure;