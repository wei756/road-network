///updateCrossRoad(instance, road list)
var _inst = argument0, _road = argument1;
if(!instance_exists(_inst) || !ds_exists(_road, ds_type_list)) return -1;

ds_list_clear(_inst.connected);

/* find road */
for(var _i = 0; _i < ds_list_size(_road); _i++) {
    if(_road[| _i].bid == _inst) {
        var __road = ds_list_create();
        ds_list_add(__road, _road[| _i], OUT, 0, 1);
        ds_list_add(_inst.connected, __road);
    }
    if(_road[| _i].eid == _inst) {
        var __road = ds_list_create();
        ds_list_add(__road, _road[| _i], IN, 0, 1);
        ds_list_add(_inst.connected, __road);
    }
}


