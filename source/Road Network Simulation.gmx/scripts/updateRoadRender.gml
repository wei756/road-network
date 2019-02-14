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

/* laneBG */
for(var _l = 0; _l < ds_list_size(_road.lane); _l++) {
    _lane = _road.lane[| _l];
    var _tmpLane = ds_list_create(); // 임시 리스트
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
    ds_list_add(_road.polyLane, _tmpLane, _road.colorTexture[_lane[| LANE_TEXTURE]], 1);
    _width += _lane[| LANE_WIDTH];
}

/* line */
_width = -(_road.width/2);
for(var _l = 0; _l <= ds_list_size(_road.lane); _l++) {
    var _tmpLine = ds_list_create(); // 임시 리스트
    for(var _i = 0; _i < ds_list_size(_curve); _i += 2) {
        var _rot;
        if (_i != ds_list_size(_curve) - 2)
            _rot = -point_direction(_curve[| _i], _curve[| _i + 1], _curve[| _i + 2], _curve[| _i + 3]);
        else
            _rot = -point_direction(_curve[| _i - 2], _curve[| _i - 1], _curve[| _i], _curve[| _i + 1]);
        show_debug_message(_rot);
        ds_list_add(_tmpLine, _curve[| _i] + _width*cos(degtorad(_rot + 90)), _curve[| _i + 1] + _width*sin(degtorad(_rot + 90)));
    }
    var _color = _road.colorLine[1], _alpha = 1;
    if (_l == 0) { // 첫 차선
        _lane1 = _road.lane[| _l];
        
        _color = _road.colorLine[0]; // 기본은 중앙선색
        if (_lane1[| LANE_TEXTURE] == 0) { // 인도
            _alpha = 0;
        } else if (_lane1[| LANE_TEXTURE] == 2) { // 버스전용
            _color = _road.colorLine[2];
        }
        ds_list_add(_road.polyLine, _tmpLine, _color, _alpha);
        _width += _lane1[| LANE_WIDTH];
        
    } else if (_l < ds_list_size(_road.lane)) { // 중간 차선
        _lane1 = _road.lane[| _l - 1];
        _lane2 = _road.lane[| _l];
        
        if (_lane1[| LANE_TEXTURE] != 0 && _lane2[| LANE_TEXTURE] != 0 && _lane1[| LANE_UPDOWN] != _lane2[| LANE_UPDOWN]) { // 중앙선
            _color = _road.colorLine[0];
        } else if (_lane1[| LANE_TEXTURE] == 2 || _lane2[| LANE_TEXTURE] == 2) { // 버스전용
            _color = _road.colorLine[2];
        } else if ((_lane1[| LANE_TEXTURE] == 0 && _lane2[| LANE_TEXTURE] > 0) || (_lane2[| LANE_TEXTURE] == 0 && _lane1[| LANE_TEXTURE] > 0)) { // 인도-차선
            _color = _road.colorLine[0];
        } else if ((_lane1[| LANE_TEXTURE] == 1 && _lane2[| LANE_TEXTURE] == 3) || (_lane2[| LANE_TEXTURE] == 1 && _lane1[| LANE_TEXTURE] == 3)) { // 차선-자전거
            _color = _road.colorLine[2];
        }
        ds_list_add(_road.polyLine, _tmpLine, _color, _alpha);
        _width += _lane2[| LANE_WIDTH];
        
    } else if (_l == ds_list_size(_road.lane)) { // 끝 차선
        _lane1 = _road.lane[| _l - 1];
        
        _color = _road.colorLine[0]; // 기본은 중앙선색
        if (_lane1[| LANE_TEXTURE] == 0) { // 인도
            _alpha = 0;
        } else if (_lane1[| LANE_TEXTURE] == 2) { // 버스전용
            _color = _road.colorLine[2];
        }
        ds_list_add(_road.polyLine, _tmpLine, _color, _alpha);
        _width += _lane1[| LANE_WIDTH];
    }
}




