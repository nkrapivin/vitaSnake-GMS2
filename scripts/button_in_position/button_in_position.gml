/// @description button_in_position(pointer_to_object)
/// @param pointer_to_object

var i_d = argument0;

var _x = i_d.x;
var _y = i_d.y;
var _mx = mouse_x;
var _my = mouse_y;
var _ret = false;

if ((_mx > _x) && (_mx < _x + BUTTON_WIDTH) && (_my > _y) && (_my < _y + BUTTON_HEIGHT))
    _ret = true;
else
    _ret = false;

//if (os_type == os_windows) _ret = false; //temp
if (!global.IsMobile) _ret = false;
return _ret;
