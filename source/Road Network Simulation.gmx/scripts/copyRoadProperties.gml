///copyRoadProperties(road, source)
var _inst = argument0, _source = argument1;

_inst.name = _source.name;
_inst.type = _source.type;
for(var _i = 0; _i < LANE_PROPERTIES; _i++) {
    ds_list_copy(_inst.lane[_i], _source.lane[_i]);
}
_inst.wall = _source.wall;
_inst.guardrail = _source.guardrail;
