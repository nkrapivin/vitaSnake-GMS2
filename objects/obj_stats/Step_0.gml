if (!activated) exit;

if (mode == 0)
{
	for (var i = 0; i < MENU_ITEMS_STATS; i++) if (button_in_position(item[i])) cursor = i;
	
    var _move = (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S")) || Gamepad.Down) - (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")) || Gamepad.Up);
    if (_move != 0)
    {
        snd_play_once(menu_move);
        cursor += _move;
        if (cursor < 0) cursor = MENU_ITEMS_STATS - 1;
        else if (cursor > MENU_ITEMS_STATS - 1) cursor = 0;
    }
    
    var _push = keyboard_check_pressed(vk_enter) || Gamepad.Choose || (button_in_position(item[cursor]) && mouse_check_button_pressed(mb_left));
    if (_push)
    {
        snd_play_once(menu_select);
        switch (cursor)
        {
            case 0: mode = 1; break;
            case 1: mode = 2; break;
            default: break;
        }
    }
}

if (keyboard_check_pressed(vk_escape) || Gamepad.Back || (scr_check_back_text() && mouse_check_button_pressed(mb_left)))
{
    snd_play_once(menu_select);
    if (mode == 0)
    {
        obj_menu.activated = true;
        with (obj_menu) splashline = splashlines[abs(a_rand()) % array_length_1d(splashlines)];
        activated = false;
    }
    if (mode > 0) mode = 0;
}