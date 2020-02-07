
if (!activated) exit;

var _move = (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S")) || Gamepad.Down) - (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")) || Gamepad.Up);
if (_move != 0)
{
    snd_play_once(menu_move);
    
    if (mode == 0)
    {
        cursor += _move;
        if (cursor > MENU_ITEMS_START - 1) cursor = 0;
        else if (cursor < 0) cursor = MENU_ITEMS_START - 1;
        global.GAME_MODE = cursor;
        show_debug_message(string(global.GAME_MODE));
    }
    else if (mode == 1)
    {
        cursord += _move;
        if (cursord > MENU_ITEMS_DIFFICULTY - 1) cursord = 0;
        else if (cursord < 0) cursord = MENU_ITEMS_DIFFICULTY - 1;
        global.GAME_DIFFICULTY = cursord;
    }
    
}

if (mode == 0)
{
	for (var i = 0; i < MENU_ITEMS_START; i++) if (button_in_position(item[i])) cursor = i;
    var _change = keyboard_check_pressed(vk_enter) || Gamepad.Choose || (button_in_position(item[cursor]) && mouse_check_button_pressed(mb_left));
    if (_change)
    {
        snd_play_once(menu_select);
        mode++;
        global.GAME_MODE = cursor;
    }
}
else if (mode == 1)
{
	for (var i = 0; i < MENU_ITEMS_DIFFICULTY; i++) if (button_in_position(itemd[i])) { cursord = i; global.GAME_DIFFICULTY = cursord; }
    var _change = keyboard_check_pressed(vk_enter) || Gamepad.Choose || (button_in_position(itemd[cursord]) && mouse_check_button_pressed(mb_left));
    if (_change)
    {
        snd_play_once(menu_select);
        //mode++;
        
        activated = false;
        with (instance_create_layer(SCREEN_WIDTH / 12,SCREEN_HEIGHT / 2, global._PLayer, obj_player))
            image_angle = -radtodeg(pi / 2);
    }
}
    
var _push = keyboard_check_pressed(vk_escape) || Gamepad.Back || (scr_check_back_text() && mouse_check_button_pressed(mb_left));
if (_push)
{
    snd_play_once(menu_select);
    if (mode == 0)
    {
        obj_menu.activated = true;
        with (obj_menu) splashline = splashlines[abs(a_rand()) % array_length_1d(splashlines)];
        activated = false;
    } else { mode--; global.GAME_DIFFICULTY = 0; }
}

