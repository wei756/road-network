///getNearestPointable(x, y, deadzone)
var _x = argument0, _y = argument1, _deadzone = argument2;
var _rx = _x, _ry = _y, _rid = -1, _rind = -1;
var _point = ds_list_create();

var _nearNode = findNearestInstance(_x, _y, System.node);

if (_nearNode != -1 && point_distance(_nearNode.x, _nearNode.y, _x, _y) < _deadzone) { // node
    _rx = _nearNode.x;
    _ry = _nearNode.y;
    _rid = _nearNode;
    
} else { // road
    var _nearRoad = findNearestEdge(System.edge, _x, _y);
    if (_nearRoad != -1) {
        var _nearPoint = findNearestPointInCurve(_nearRoad.curve, _x, _y);
        if (_nearPoint != -1 && getPointDistance(_nearRoad.curve, _nearPoint,  _x, _y) < deadzone) {
            _rx = _nearRoad.curve[| _nearPoint*2];
            _ry = _nearRoad.curve[| _nearPoint*2 + 1];
            _rid = _nearRoad;
            _rind = _nearPoint;
        }
    }
}

ds_list_add(_point, _rx, _ry);
if (_rid != -1) { ds_list_add(_point, _rid); }
if (_rind != -1) { ds_list_add(_point, _rind); }

return _point;
