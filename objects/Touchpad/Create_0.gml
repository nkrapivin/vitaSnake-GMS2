if (!global.IsMobile)
{
	perform = false;
}
else
{
	perform = true;
}

device_mouse_dbclick_enable(false);
display_set_gui_maximize();

w = display_get_gui_width();
w_half = w / 2;

axish = 0;
axisv = 0;
angle = -1;

activated = false;