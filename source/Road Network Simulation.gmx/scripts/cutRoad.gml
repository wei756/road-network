///cutRoad(edge, point index)
var _edge = argument0, _ind = argument1;
var _rate = _ind*2/(ds_list_size(_edge.curve) - 2); // cut rate
var _bid = _edge.bid, _eid = _edge.eid; // original begin/end node
var _px = _edge.px, _py = _edge.py; // original bezier point

// begin side road
_edge.eid = addList(System.node, ds_list_find_value(_edge.curve, _ind*2), ds_list_find_value(_edge.curve, _ind*2 + 1), CrossRoad);
_edge.px = _px*_rate + _bid.x*(1 - _rate);
_edge.py = _py*_rate + _bid.y*(1 - _rate);
// end side road
return addRoad(_edge.eid, _eid, _eid.x*_rate + _px*(1 - _rate), _eid.y*_rate + _py*(1 - _rate), 0);
