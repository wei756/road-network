///updateRoadRender(road)
var _road = argument0;

if (!instance_exists(_road)) { return INSTANCE_NOT_EXIST; }

/* reset rendering data */
var _list;
for(var _i = 0; _i < ds_list_size(_road.polyLane); _i++) {
    _list = _road.polyLane[| _i];
    ds_list_destroy(_list);
    ds_list_clear(_road.polyLane);
}
for(var _i = 0; _i < ds_list_size(_road.polyLine); _i++) {
    _list = _road.polyLine[| _i];
    ds_list_destroy(_list);
    ds_list_clear(_road.polyLine);
}
for(var _i = 0; _i < ds_list_size(_road.polyDecal); _i++) {
    _list = _road.polyDecal[| _i];
    ds_list_destroy(_list);
    ds_list_clear(_road.polyDecal);
}

/* generate rendering data */
var _curve = _road.curve, _lane, _width = -(_road.width/2);
for(var _l = 0; _l < ds_list_size(_road.lane); _l++) {
    _lane = _road.lane[| _l];
    var _tmpLane = ds_list_create();
    for(var _i = 0; _i < ds_list_size(_curve); _i += 2) {
        var _rot;
        if (_i != ds_list_size(_curve) - 2)
            _rot = -point_direction(_curve[| _i], _curve[| _i + 1], _curve[| _i + 2], _curve[| _i + 3]);
        else
            _rot = -point_direction(_curve[| _i - 2], _curve[| _i - 1], _curve[| _i], _curve[| _i + 1]);
        show_debug_message(_rot);
        ds_list_add(_tmpLane, _curve[| _i] + _width*cos(degtorad(_rot + 90)), _curve[| _i + 1] + _width*sin(degtorad(_rot + 90)));
        ds_list_add(_tmpLane, _curve[| _i] + (_width + _lane[| LANE_WIDTH])*cos(degtorad(_rot + 90)), _curve[| _i + 1] + (_width + _lane[| LANE_WIDTH])*sin(degtorad(_rot + 90)));
    }
    /*
    for(var _i = ds_list_size(_curve) - 2; _i >= 0; _i -= 2) {
        var _rot;
        if (_i != ds_list_size(_curve) - 2)
            _rot = point_direction(_curve[| _i], _curve[| _i + 1], _curve[| _i + 2], _curve[| _i + 3]);
        else
            _rot = point_direction(_curve[| _i - 2], _curve[| _i - 1], _curve[| _i], _curve[| _i + 1]);
        
        ds_list_add(_tmpLane, _curve[| _i] + (_width + _lane[| LANE_WIDTH])*cos(degtorad(_rot + 90)), _curve[| _i + 1] + (_width + _lane[| LANE_WIDTH])*sin(degtorad(_rot + 90)));
    }
    */
    ds_list_add(_road.polyLane, _tmpLane, _road.colorTexture[_lane[| LANE_TEXTURE]], 1);
    _width += _lane[| LANE_WIDTH];
}
