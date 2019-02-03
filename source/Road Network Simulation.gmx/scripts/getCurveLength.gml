///getCurveLength(curve)
var _curve = argument0, _length = 0;
for(var _i = 0; _i < ds_list_size(_curve) - 2; _i += 2)
    _length += point_distance(_curve[| _i], _curve[| _i + 1], _curve[| _i + 2], _curve[| _i + 3]);
return _length;
