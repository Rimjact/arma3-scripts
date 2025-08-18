// main.sqf

// Возвращает центральное значение карты
FNC_getWorldCenterCoordinates = {
    private _worldCenter = worldSize / 2;
    private _worldCenterCoordinates = [_worldCenter, _worldCenter];

    _worldCenterCoordinates;
};

// Возвращает все локации на карте по типу
FNC_getAllLocationsByType = {
    params ['_locationType'];

    private _coordinates = call FNC_getWorldCenterCoordinates;
    private _locationsType = _this;
    private _radius = _coordinates distance2D [0, 0];

    private _locations = nearestLocations [_coordinates, [_locationsType], _radius];

    _locations;
};

// Создаёт маркер зоны на указанной позции
FNC_createMarker = {
    params ['_pos'];

    private _pos = _this;

    private _marker = createMarker ["target_marker", _pos];
    _marker setMarkerShape "ELLIPSE";
    _marker setMarkerSize [25, 25];
    _marker setMarkerColor "ColorRed";
    _marker setMarkerBrush "Border";

    _marker;
};

// Создаёт случайного противника на позиции и в группе
FNC_spawnRandomEnemy = {
    params ['_pos', '_group'];

    private _type = selectRandomWeighted ["O_G_Soldier_F", 0.6, "O_G_Soldier_M_F", 0.2, "O_G_Soldier_AR_F", 0.2];
    private _pos = _this select 0;
    private _group = _this select 1;

    _type createUnit [_pos, _group];
};

// Создаёт случайных противников на позиции и в группе
FNC_spawnEnemies = {
    params ['_pos', '_group'];

    private _pos = _this select 0;
    private _group = _this select 1;
    private _randomNumber = [1, 3] call BIS_fnc_randomInt;

    for "_i" from 1 to _randomNumber do {
        [_pos, _group] call FNC_spawnRandomEnemy;
    };
};

// Создаёт задачу для игрока на маркере
FNC_createTaskForPly = {
    params ['_marker'];

    private _marker = _this;

    [
        player,
        "kill_enemies",
        ["Убейте всех противников", "Штурм", ""],
        _marker,
        "ASSIGNED",
        1,
        true,
        "attack",
        true
    ] call BIS_fnc_taskCreate;
};

// Телепорт игрока ближе к центру локации
FNC_teleportPlyAtLocation = {
    params ['_pos'];

    private _pos = _this;
    private _targetPos = [_pos, 50, 60] call BIS_fnc_findSafePos;

    player setPos _targetPos;
};


private _allLocations = "Mount" call FNC_getAllLocationsByType;
private _location = selectRandom _allLocations;

private _locationPos = position _location;

private _enemiesGroup = createGroup opfor;

private _marker = _locationPos call FNC_createMarker;
_marker call FNC_createTaskForPly;

[_locationPos, _enemiesGroup] call FNC_spawnEnemies;

_locationPos call FNC_teleportPlyAtLocation;

waitUntil {sleep 3; count allUnits == 1};

endMission "END1";