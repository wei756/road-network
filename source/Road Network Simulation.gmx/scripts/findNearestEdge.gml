///findNearestEdge(instance list, x, y)
//(x, y)와 가장 가까운 인스턴스를 instance list중에서 찾아 인스턴스 id를 반환합니다.
var _list = argument0, _x = argument1, _y = argument2;
var _nid = 0, _dist = 9999999999999;

if (ds_list_size(_list) == 0) return -1;

for(var _i = 0; _i < ds_list_size(_list); _i++) {
    var _id = ds_list_find_value(_list, _i);
    var _nearPoint = findNearestPointInCurve(_id.curve, _x, _y);
    var __dist = point_distance(ds_list_find_value(_id.curve, _nearPoint*2), ds_list_find_value(_id.curve, _nearPoint*2 + 1), _x, _y);
    if(_dist > __dist) {
        _dist = __dist;
        _nid = _i;
    }
}
return ds_list_find_value(_list, _nid);
