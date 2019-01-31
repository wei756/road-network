///makeBezierCurve(begin x1, begin y1, end x2, end y2, point x3, point y3, resolution);
var _bx = argument0, _by = argument1, _ex = argument2, _ey = argument3, _px = argument4, _py = argument5;
var _resol = max(round(point_distance(_bx, _by, _ex, _ey) * argument6 / 10), 5);
var _result = ds_list_create();
var _px1, _py1, _px2, _py2, _rx, _ry;
for(var _i = 0; _i <= _resol; _i++) {
    _px1 = (_px*_i + _bx*(_resol - _i));
    _py1 = (_py*_i + _by*(_resol - _i));
    _px2 = (_ex*_i + _px*(_resol - _i));
    _py2 = (_ey*_i + _py*(_resol - _i));
    
    _rx = (_px2*_i + _px1*(_resol - _i)) / _resol / _resol;
    _ry = (_py2*_i + _py1*(_resol - _i)) / _resol / _resol;
    ds_list_add(_result, _rx, _ry);
}
return _result;
