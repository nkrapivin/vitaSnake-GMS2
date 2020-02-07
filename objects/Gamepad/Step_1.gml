/// @description Fill gamepad vars

if (os_type != os_switch)
{
	Exists = false;
	if (gp_id == -1 && !global.IsMobile) exit;
	else Angle = Touchpad.angle;
	Left = gamepad_button_check_pressed(gp_id, gp_padl);
	Right = gamepad_button_check_pressed(gp_id, gp_padr);
	Up = gamepad_button_check_pressed(gp_id, gp_padu);
	Down = gamepad_button_check_pressed(gp_id, gp_padd);

	Choose = gamepad_button_check_pressed(gp_id, gp_face1);
	Back = gamepad_button_check_pressed(gp_id, gp_face2);
	Pause = gamepad_button_check_pressed(gp_id, gp_start);

	if (!global.IsMobile)
	{
		AxisLH = gamepad_axis_value(gp_id, gp_axislh);
		AxisLV = gamepad_axis_value(gp_id, gp_axislv);
	}
	else
	{
		AxisLH = Touchpad.axish;
		AxisLV = Touchpad.axisv;
	}
	Exists = true;
}
else
{
	var l,r,u,d,c,b,p,h,v;
	with (SwitchPad)
	{
		l = gamepad_button_check_pressed(mPadId,gp_padl);
		r = gamepad_button_check_pressed(mPadId,gp_padr);
		u = gamepad_button_check_pressed(mPadId,gp_padu);
		d = gamepad_button_check_pressed(mPadId,gp_padd);
		
		c = gamepad_button_check_pressed(mPadId, gp_face2);
		b = gamepad_button_check_pressed(mPadId, gp_face1);
		p = gamepad_button_check_pressed(mPadId, gp_start);
		
		h = gamepad_axis_value(mPadId, gp_axislh);
		v = gamepad_axis_value(mPadId, gp_axislv);
		
		if (scr_is_between(h,-.5,5)) mXTimer = 0;
		if (scr_is_between(v,-.5,5)) mYTimer = 0;
		if (mXTimer > 0) mXTimer--;
		if (mYTimer > 0) mYTimer--;
		
		if (mYTimer < 1 && h > .5)
		{
			mYTimer = 9999;
			d = true;
			u = false;
		}
		
		if (mYTimer < 1 && h < -.5)
		{
			mYTimer = 9999;
			u = true;
			d = false;
		}
		
		if (mXTimer < 1 && h > .5)
		{
			mXTimer = 9999;
			r = true;
			l = false;
		}
		
		if (mXTimer < 1 && h < -.5)
		{
			mXTimer = 9999;
			l = true;
			r = false;
		}
		
		if (l) other.Left = l;
		if (r) other.Right = r;
		if (u) other.Up = u;
		if (d) other.Down = d;
		if (c) other.Choose = c;
		if (b) other.Back = d;
		if (p) other.Pause = p;
		if (!scr_is_between(h,-.5,5)) other.AxisLH = h;
		if (!scr_is_between(v,-.5,5)) other.AxisLV = v;
	}
}