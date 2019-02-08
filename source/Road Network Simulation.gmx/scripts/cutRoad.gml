///cutRoad(road, point index)
var _road = argument0, _ind = argument1;
var _rate = _ind*2/(ds_list_size(_road.curve) - 2); // cut rate
var _bid = _road.bid, _eid = _road.eid; // original begin/end node
var _px = _road.px, _py = _road.py; // original bezier point

// begin side road
_road.eid = addList(System.node, ds_list_find_value(_road.curve, _ind*2), ds_list_find_value(_road.curve, _ind*2 + 1), CrossRoad);
_road.px = _px*_rate + _bid.x*(1 - _rate);
_road.py = _py*_rate + _bid.y*(1 - _rate);
// end side road
var _newRoad = addRoad(_road.eid, _eid, _eid.x*_rate + _px*(1 - _rate), _eid.y*_rate + _py*(1 - _rate), 0);
copyRoadProperties(_newRoad, _road);

return _newRoad;
