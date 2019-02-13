///updateRoadWidth(road)
var _road = argument0;

if (!instance_exists(_road)) { return INSTANCE_NOT_EXIST; }

_road.width = 0;
var _lane;
for(var _i = 0; _i < ds_list_size(_road.lane); _i++) {
    _lane = _road.lane[| _i];
    _road.width += _lane[| LANE_WIDTH];
}

return 0;
