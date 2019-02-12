///addLane(road, list:properties)
//properties|type, updown, width, join type, car:human, car:personal, car:fire/police, car:trash, car:truck, car:bicycle, maxspeed, view line
var _road = argument0, _lane = argument1, __lane = ds_list_create();

if (!instance_exists(_road)) { return INSTANCE_NOT_EXIST; }
if (ds_list_size(_lane) != LANE_PROPERTIES) { return -2; }

ds_list_copy(__lane, _lane);
ds_list_add(_road.lane, __lane);
updateRoadWidth(_road);

return 0;
