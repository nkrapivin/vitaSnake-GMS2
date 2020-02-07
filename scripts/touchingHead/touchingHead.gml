/// @desc touchingHead()

var touch_zone = 20;

with (obj_player)
{
	if( mouse_check_button(mb_left) )
	{
		if ( 
			( ( snakeParts[0].x + touch_zone ) > mouse_x ) &&
			( mouse_x > ( snakeParts[0].x - touch_zone ) ) &&
			( ( snakeParts[0].y + touch_zone ) > mouse_y ) &&
			( mouse_y > ( snakeParts[0].y - touch_zone ) )
		)
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	else
	{
		return false;
	}
}