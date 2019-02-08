///addRoad(start node, end node, point x, point y, lane preset)
var _snid = argument0, _enid = argument1, _px = argument2, _py = argument3, _preset = argument4;
var _road = addList(edge, _snid.x, _snid.y, Road);
_road.bid = _snid;
_road.eid = _enid;
_road.px = _px;
_road.py = _py;
initRoad(_road);

//preset
return _road;
