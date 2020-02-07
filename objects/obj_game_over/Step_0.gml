for (var i = 0; i < MENU_ITEMS_GAMEOVER; i++) if (button_in_position(item[i])) cursor = i;

var _move = (keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A")) || Gamepad.Left) - (keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D")) || Gamepad.Right);
if (_move != 0)
{
	snd_play_once(menu_move);
	cursor += _move;
	if (cursor < 0) cursor = MENU_ITEMS_GAMEOVER - 1;
	else if (cursor > MENU_ITEMS_GAMEOVER - 1) cursor = 0;
}

var _push = keyboard_check_pressed(vk_enter) || Gamepad.Choose || (button_in_position(item[cursor]) && mouse_check_button_pressed(mb_left));
if (_push)
{
	snd_play_once(menu_select);
	switch (cursor)
	{
		case 0:
		{
			with (obj_player) for (var i = 0; i < array_length_1d(snakeParts); i++) instance_destroy(snakeParts[i]);
			with (obj_apple)  for (var i = 0; i < array_length_1d(particles); i++)  instance_destroy(particles[i]);
			with (obj_apple)  fibonacci = 0;
			for (var i = 0; i < MENU_ITEMS_GAMEOVER; i++) instance_destroy(item[i]);
			instance_destroy(obj_player);
			instance_destroy(obj_apple);
			with (instance_create_layer(SCREEN_WIDTH / 12,SCREEN_HEIGHT / 2, global._PLayer, obj_player))
				image_angle = -radtodeg(pi / 2);
			instance_destroy();
			break;
		}
		case 1:
		{
			with (obj_player) for (var i = 0; i < array_length_1d(snakeParts); i++) instance_destroy(snakeParts[i]);
			with (obj_apple)  for (var i = 0; i < array_length_1d(particles); i++)  instance_destroy(particles[i]);
			with (obj_apple)  fibonacci = 0;
			for (var i = 0; i < MENU_ITEMS_GAMEOVER; i++) instance_destroy(item[i]);
			instance_destroy(obj_player);
			instance_destroy(obj_apple);
			obj_menu.activated = true;
			instance_destroy();
			break;
		}
		default: break;
	}
}