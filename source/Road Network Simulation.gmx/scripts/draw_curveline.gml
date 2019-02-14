///draw_curveline(curve list, length, margin)
var _poly = argument0, _length = argument1, _margin = argument2;
if (!ds_exists(_poly, ds_type_list)) { return INSTANCE_NOT_EXIST; }
if (ds_list_size(_poly) % 2 != 0) { return -2; }

var __length = ds_list_size(_poly);
draw_primitive_begin(pr_linestrip);
for(var _i = 0; _i < __length; _i += 2)
    draw_vertex(_poly[| _i], _poly[| _i + 1]);
draw_primitive_end();
