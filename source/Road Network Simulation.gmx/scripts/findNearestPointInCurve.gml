///findNearestPointInCurve(curve, x, y)
// curve 내에서 (x, y)와 가장 가까운 포인트의 인덱스를 반환합니다.
var _curve = argument0, _x = argument1, _y = argument2;
var _near = 0;
if (!ds_exists(_curve, ds_type_list) || ds_list_size(_curve) == 0) return -1;

for(var _i = 0; _i < ds_list_size(_curve); _i += 2) {
    if (point_distance(ds_list_find_value(_curve, _i), ds_list_find_value(_curve, _i + 1), _x, _y) < point_distance(ds_list_find_value(_curve, _near), ds_list_find_value(_curve, _near + 1), _x, _y))
        _near = _i;
}
return _near/2;
