
if (!activated) exit;
global.GAME_DIFFICULTY = 0;

for (var i = 0; i < MENU_ITEMS_MAIN; i++) if (button_in_position(item[i])) cursor = i;

var _move = (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S")) || Gamepad.Down) - (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")) || Gamepad.Up);
if (_move != 0)
{
    cursor += _move;
    if (cursor > MENU_ITEMS_MAIN - 1) cursor = 0;
    else if (cursor < 0) cursor = MENU_ITEMS_MAIN - 1;
    
    snd_play_once(menu_move);
}

var _push = keyboard_check_pressed(vk_enter) || Gamepad.Choose || (mouse_check_button_pressed(mb_left) && button_in_position(item[cursor]));
if (_push)
{
    snd_play_once(menu_select);
    var _t = current_time + 200;
    switch (cursor)
    {
        case 0: event_user(2); break;
        case 1: event_user(1); break;
        case 2: event_user(0); break;
        case 3:
        {
            do { /* nothing */ } until (!audio_is_playing(menu_select) && _t < current_time);
            game_end();
            break;
        }
        default: break;
    }
}

/* */
/*  */
