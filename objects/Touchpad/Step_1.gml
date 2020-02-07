
if (!activated || !perform) exit;
axish = 0;
axisv = 0;
angle = -1;
for (var i = 5; i > -1; i--)
{
	var _mx = device_mouse_x_to_gui(i);
	var _my = device_mouse_y_to_gui(i);
	var _mp = device_mouse_check_button(i,mb_left);
	//var _mpp = device_mouse_check_button(i-1,mb_left);
	if (global.CONTROL_STYLE == 0 && _mp)
	{
		if (_mx < w_half) axish = -1;
		else if (_mx > w_half) axish = 1;
		else axish = 0;
		axisv = 0;
	}
	else if (global.CONTROL_STYLE == 1 && _mp)
	{
		axish = ((_mx - obj_player.x) * (1));
		axisv = ((_my - obj_player.y) * (1));
	}
}