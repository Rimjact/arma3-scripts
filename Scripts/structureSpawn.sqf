// structureSpawn.sqf

private _structureObjects = [
	["Land_HBarrier_5_F",[-5.12793,1.57813,0],324.922,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[4.23145,4.32617,0],179.263,1,0,[0,-0],"","",true,false], 
	["Land_HBarrier_5_F",[5.05566,4.17383,0],23.8596,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[-10.0576,2.98828,0],21.7148,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[-1.43066,11.5957,0],357.498,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[10.1865,1.82813,0],43.2557,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[-15.4736,2.53516,0],354.618,1,0,[0,0],"","",true,false], 
	["Land_BarrelSand_grey_F",[1.79395,14.0293,0],200.404,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[4.02832,12.0938,0],329.047,1,0,[0,0],"","",true,false], 
	["Land_BarrelEmpty_F",[2.3623,14.8086,0],143.945,1,0,[0,-0],"","",true,false], 
	["Land_PaperBox_open_empty_F",[12.6943,7.99219,0],166.944,1,0,[0,-0],"","",true,false], 
	["Land_HBarrier_5_F",[14.2959,-1.63867,0],1.98476,1,0,[0,0],"","",true,false], 
	["Land_PaperBox_closed_F",[14.5928,9.13672,0],20.4457,1,0,[0,0],"","",true,false], 
	["Land_WaterTank_F",[4.10059,17.4668,0],270.438,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[-19.2646,6.38086,0],48.1373,1,0,[0,0],"","",true,false], 
	["Land_Cargo_Patrol_V3_F",[18.3564,3.20313,0],314.038,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[8.23926,15.209,0],273.522,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[-16.2822,14.5742,0],36.5702,1,0,[0,0],"","",true,false], 
	["Land_PortableLight_double_F",[19.9717,1.54102,0],311.55,1,0,[0,0],"","",true,false], 
	["Land_PortableLight_double_F",[-2.48145,20.3809,0],357.007,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[22.71,1.75391,0],133.912,1,0,[0,-0],"","",true,false], 
	["Land_HBarrier_3_F",[-19.7119,6.54883,0],180.593,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[8.35449,20.4297,0],242.879,1,0,[0,0],"","",true,false], 
	["Land_GarbageBags_F",[-0.618164,24.6445,0],158.176,1,0,[0,-0],"","",true,false], 
	["Land_HBarrier_5_F",[23.3896,7.04883,0],93.7194,1,0,[0,-0],"","",true,false], 
	["Land_HBarrier_5_F",[-16.6299,19.4668,0],88.7307,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[-23.2627,6.45898,0],270.843,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[23.5068,12.6934,0],91.2719,1,0,[0,-0],"","",true,false], 
	["Land_Cargo_HQ_V3_F",[-9.58105,25.9727,0],267.333,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[-23.2197,11.9219,0],271.273,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[6.22754,25.377,0],271.403,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[-19.6338,23.5176,0],50.8217,1,0,[0,0],"","",true,false], 
	["Land_ToiletBox_F",[1.96191,28.7598,0],359.154,1,0,[0,0],"","",true,false], 
	["Land_ToiletBox_F",[4.48145,28.7813,0],359.221,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[25.3311,17.9414,0],109.927,1,0,[0,-0],"","",true,false], 
	["Land_PortableLight_double_F",[-14.7451,26.0859,0],88.5717,1,0,[0,0],"","",true,false], 
	["Land_Tyres_F",[9.07324,29.3262,0.00659752],202.603,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[-23.2686,16.9629,0],231.211,1,0,[0,0],"","",true,false], 
	["Land_PortableLight_double_F",[-1.33105,31.1504,0],228.261,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[6.46582,31.1758,0],180.593,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[25.4971,19.0215,0],240.934,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[0.983398,31.4473,0],230.768,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[-20.1104,28.998,0],88.1428,1,0,[0,0],"","",true,false], 
	["Land_Pallet_F",[18.4248,29.4512,0],168.535,1,0,[0,-0],"","",true,false], 
	["Land_HBarrier_5_F",[23.124,23.8711,0],270.637,1,0,[0,0],"","",true,false]
];

// Спавнит структуру
SCS_spawnStructure = {
    params ["_pos", "_objectsArray"];

    private _pos = _this select 0;
    private _objectsArray = _this select 1;

    [_pos, 0, _objectsArray] call BIS_fnc_objectsMapper;
};

// Возвращает сейвовую позицию для спавна структуры
SCS_getSafeSpawnPos = {
    params ["_targetPos"];

    private _targetPos = _this select 0;
    private _targetSafePos = [[[_targetPos, 500]], ["water"], { count (nearestObjects [_this, ["House", "Building"], 50]) == 0 }] call BIS_fnc_randomPos;

    _targetSafePos;
};


private _spawnPos = [getPos structSpawnTestLocation] call SCS_getSafeSpawnPos;

[_spawnPos, _structureObjects] call SCS_spawnStructure;