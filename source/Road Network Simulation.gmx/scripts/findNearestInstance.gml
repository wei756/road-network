///findNearestInstance(x, y, list)
var _x = argument0, _y = argument1, _list = argument2, _size = ds_list_size(_list);
if (_size == 0) { return -1; }

var _near = _list[| 0];
for(var _i = 1; _i < _size; _i++)
    if (point_distance(_x, _y, _near.x, _near.y) > point_distance(_x, _y, _list[| _i].x, _list[| _i].y))
        _near = _list[| _i];
return _near;
