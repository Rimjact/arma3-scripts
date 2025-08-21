// triggerSpawn.sqf

// Возвращает позицию центра карты
TGS_getWorldCenterCoordinates = {
    private _worldCenter = worldSize / 2;
    private _worldCenterCoordinates = [_worldCenter, _worldCenter];

    _worldCenterCoordinates;
};

// Возвращает все локации на карте по заданному типу
TGS_getAllLocationsByTypes = {
    params ['_locationTypes'];

    private _worldCenterCoordinates = call TGS_getWorldCenterCoordinates;
    private _locationTypes = _this;
    private _radius = _worldCenterCoordinates distance2D [0, 0];

    private _locations = nearestLocations [_worldCenterCoordinates, _locationTypes, _radius];

    _locations;
};

// Создаёт маркер на карте ввиде окружности для триггера
TGS_createMarker = {
    params ["_pos"];

    private _pos = _this;

    private _marker = createMarker ["TGS_trigger_marker", _pos];
    _marker setMarkerShape "ELLIPSE";
    _marker setMarkerSize [800, 800];
    _marker setMarkerColor "ColorRed";
    _marker setMarkerBrush "SolidBorder";

    _marker;
};

// Создаёт триггер
TGS_createTrigger = {
    params ["_pos"];

    private _pos = _this;

    private _trigger = createTrigger ["EmptyDetector", _pos, true];
    _trigger setTriggerArea [800, 800, 0, false];
    _trigger setTriggerActivation ["WEST", "NOT PRESENT", false];
    _trigger setTriggerStatements
    [
        "this",
        "['TGS_clear_trigger', 'SUCCEEDED'] call BIS_fnc_taskSetState; ['TGS_trigger_marker', 'ColorGreen', 1] spawn BIS_fnc_colorMarker;",
        ""
    ];
};

// Создаёт задачу для игрока
TGS_createTaskForEast = {
    params ["_marker", "_id", "_description", "_priority", "_iconName"];

    private _marker = _this select 0;
    private _id = _this select 1;
    private _description = _this select 2;
    private _priority = _this select 3;
    private _iconName = _this select 4;

    [
        east,
        _id,
        _description,
        _marker,
        "ASSIGNED",
        _priority,
        true,
        _iconName,
        true
    ] call BIS_fnc_taskCreate;
};

// Спавнит противника
TGS_spawnEnemyUnit = {
    params ['_type', '_pos', '_group'];

    private _type = _this select 0;
    private _pos = _this select 1;
    private _group = _this select 2;

    _type createUnit [_pos, _group];
};

private _locationTypes = ["NameCity", "NameCityCapital", "NameVillage"];
private _allLocations = _locationTypes call TGS_getAllLocationsByTypes;
private _location = selectRandom _allLocations;
private _locationPos = locationPosition _location;
private _locationName = text _location;

private _marker = _locationPos call TGS_createMarker;

[
    _marker,
    "TGS_clear_trigger",
    ["Полностью зачистите триггер от противника.", format ["Зачистка локации %1", _locationName], ""],
    1,
    "attack"
] call TGS_createTaskForEast;

private _enemyPos = [_locationPos, 10, 400] call BIS_fnc_findSafePos;
private _enemyGroup = createGroup blufor;

['B_Soldier_SL_F', _enemyPos, _enemyGroup] call TGS_spawnEnemyUnit;
['B_medic_F', _enemyPos, _enemyGroup] call TGS_spawnEnemyUnit;

_locationPos call TGS_createTrigger;