for (var i = 0; i < MENU_ITEMS_PAUSE; i++) if (button_in_position(item[i])) cursor = i;

var _move = (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S")) || Gamepad.Down) - (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")) || Gamepad.Up);
if (_move != 0)
{
	snd_play_once(menu_move);
	cursor += _move;
	if (cursor < 0) cursor = MENU_ITEMS_PAUSE - 1;
	else if (cursor > MENU_ITEMS_PAUSE - 1) cursor = 0;
}

_t = clamp(_t+1,0,3);

var _push = keyboard_check_released(vk_enter) || Gamepad.Choose || (button_in_position(item[cursor]) && mouse_check_button_pressed(mb_left)); //released here because it's a pause menu.
if (_push)
{
	snd_play_once(menu_select);
	switch (cursor)
	{
		case 0: //unpause
		{
			for (var i = 0; i < MENU_ITEMS_PAUSE; i++) instance_destroy(item[i]);
			obj_player.paused = false;
			Touchpad.activated = true;
			instance_destroy();
			break;
		}
		
		case 1: //go to menu, will not save changes.
		{
			with (obj_player) for (var i = 0; i < array_length_1d(snakeParts); i++) instance_destroy(snakeParts[i]);
			with (obj_apple)  for (var i = 0; i < array_length_1d(particles); i++) instance_destroy(particles[i]);
			with (obj_apple)  fibonacci = 0;
			for (var i = 0; i < MENU_ITEMS_PAUSE; i++) instance_destroy(item[i]);
			obj_menu.activated = true;
			instance_destroy();
			instance_destroy(obj_player);
			instance_destroy(obj_apple);
			break;
		}
		
		default: break;
	}
}

if (keyboard_check_pressed(vk_escape) && _t > 2)
{
	for (var i = 0; i < MENU_ITEMS_PAUSE; i++) instance_destroy(item[i]);
	obj_player.paused = false;
	Touchpad.activated = true;
	instance_destroy();
}