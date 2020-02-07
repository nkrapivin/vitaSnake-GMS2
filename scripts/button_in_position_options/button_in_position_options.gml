/// @description button_in_position_options(pointer_to_object)
/// @param pointer_to_object

var i_d = argument0;

var _w = text_width + 40;
var _x = i_d.slct_x - (_w / 2) - 20;
var _y = i_d.slct_y - 30;
var _mx = mouse_x;
var _my = mouse_y;
var _ret = false;

if ((_mx > _x) && (_mx < _x + _w) && (_my > _y) && (_my < _y + _w))
    _ret = true;
else
    _ret = false;
    
in_position = _ret;

//if (os_type == os_windows) _ret = false; //temp
if (!global.IsMobile) _ret = false;
return _ret;
