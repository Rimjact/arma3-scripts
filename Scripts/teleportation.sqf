// teleportation.sqf

// Телепортирует указанного игрока в указанную точку
TP_teleport = {
    params ["_player", "_targetPoint"];

    private _ply = _this select 0;
    private _targetPoint = _this select 1;
    private _targetPointPosition = getPosATL _targetPoint;

    _ply setPosATL _targetPointPosition;
};

// Добавляет действие телепорта для объекта
TP_addTPAction = {
    params ["_object", "_title", "_priority", "_targetObject"];

    private _object = _this select 0;
    private _title = _this select 1;
    private _priority = _this select 2;
    private _targetObject = _this select 3;

    _object addAction [
        _title,
        {
            params ["_target", "_caller", "_actionId", "_arguments"];

            [player, _this select 3] call TP_teleport;
        },
        _targetObject,
        _priority,
        true,
        true,
        "",
        "true",
        2,
        false,
        "",
        ""
    ];
};

// Добавляет действия на все нужные телепорты
TP_addTPActions = {
    // Main teleport
    [teleportMain, "На военную базу", 1, teleportPointMillitaryBase] call TP_addTPAction;
    [teleportMain, "В Пиргос", 2, teleportPointPirgos] call TP_addTPAction;

    // Millitary Base teleport
    [teleportMillitaryBase, "На главный", 1, teleportPointMain] call TP_addTPAction;

    // Pirgos teleport
    [teleportPirgos, "На главный", 1, teleportPointMain] call TP_addTPAction;
};


call TP_addTPActions;