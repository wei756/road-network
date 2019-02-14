///copyRoadProperties(road, source)
var _inst = argument0, _source = argument1;

_inst.name = _source.name;
_inst.type = _source.type;
ds_list_clear(_inst.lane);
for(var _i = 0; _i < ds_list_size(_source.lane); _i++) {
    var _lane = ds_list_create();
    ds_list_copy(_lane, _source.lane[| _i]);
    ds_list_add(_inst.lane, _lane);
}
_inst.wall = _source.wall;
_inst.guardrail = _source.guardrail;
