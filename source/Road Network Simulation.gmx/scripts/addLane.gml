///addLane(road, list:properties)
//properties|type, updown, width, join type, tree, car:human, car:personal, car:fire/police, car:trash, car:truck, car:bicycle, maxspeed, view line
var _road = argument0, _lane = argument1;

if (!instance_exists(_road)) { return INSTANCE_NOT_EXIST; }
if (ds_list_size(_lane) != LANE_PROPERTIES) { return -2; }

ds_list_add(_road.lane, _lane);

return 0;
