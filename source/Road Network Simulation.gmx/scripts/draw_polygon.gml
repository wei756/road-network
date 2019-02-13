///draw_polygon(polygon list, outline)
var _poly = argument0, _outline = argument1;
if (!ds_exists(_poly, ds_type_list)) { return INSTANCE_NOT_EXIST; }
if (ds_list_size(_poly) % 2 != 0) { return -2; }

if (_outline == 1) {
    var _length = ds_list_size(_poly);
    draw_primitive_begin(pr_linelist);
    for(var _i = 0; _i < _length; _i += 2)
        draw_vertex(_poly[| _i], _poly[| _i + 1]);
    draw_primitive_end();
        //draw_line(_poly[| _i], _poly[| _i + 1], _poly[| (_i + 2) % _length], _poly[| (_i + 3) % _length]);
} else {
    var _length = ds_list_size(_poly);
    draw_primitive_begin(pr_trianglestrip);
    for(var _i = 0; _i < _length; _i += 2)
        draw_vertex(_poly[| _i], _poly[| _i + 1]);
    draw_primitive_end();
    /*
    for(var _i = 2; _i < _length - 2; _i += 2)
        draw_triangle(_poly[| 0], _poly[| 1], _poly[| _i], _poly[| _i + 1], _poly[| _i + 2], _poly[| _i + 3], 0);*/
}
