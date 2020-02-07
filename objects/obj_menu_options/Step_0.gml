if (!activated) exit;

for (var i = 0; i < MENU_ITEMS_OPTIONS; i++) if (button_in_position_options(option[i])) cursor = i;

apple_xmid = apple_x + ( apple_w / 2 );
apple_ymid = apple_y + ( apple_h / 2 );
if (global.ENABLE_ANIMATION)
{
    apple_r = sin( apple_step ) * pi/10;
    apple_step += 0.08 * 1;
    
    if (apple_step > 2*pi)
        apple_step -= 2*pi;
}
else apple_r = 0;

var _move = (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S")) || Gamepad.Down) - (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")) || Gamepad.Up);
if (_move != 0)
{
    cursor += _move;
    if (cursor > MENU_ITEMS_OPTIONS - 1) cursor = 0;
    else if (cursor < 0) cursor = MENU_ITEMS_OPTIONS - 1;
    
    snd_play_once(menu_move);
}

var _change = (keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D")) || Gamepad.Right) - (keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A")) || Gamepad.Left);
if (keyboard_check_pressed(vk_enter) || Gamepad.Choose || (button_in_position_options(option[cursor]) && mouse_check_button_pressed(mb_left))) _change = 1;
if (_change != 0)
{
    snd_play_once(menu_move);
    with (option[cursor])
    {
        selected += _change;
        if (selected > nr_selectables - 1) selected = 0;
        else if (selected < 0) selected = nr_selectables - 1;
        
        switch (_id)
        {
            case 0:
            {
                global.CONTROL_STYLE = selected;
                break;
            }
            case 1:
            {
                global.PLAYER_TEXTURES = selected;
                break;
            }
            case 2:
            {
                global.BGID = selected;
                break;
            }
            case 3:
            {
                global.APPLE_TEXTURE = selected;
                break;
            }
            case 4:
            {
                if (selected == 0)
                {
                    global.ENABLE_ANIMATION = true;
                    global.ENABLE_PARTICLES = true;
                }
                else
                {
                    global.ENABLE_ANIMATION = false;
                    global.ENABLE_PARTICLES = false;
                }
                break;
            }
            case 5:
            {
                global.ENABLE_FULLSCREEN = !selected;
                scr_options_fullscreen();
                break;
            }
            default: break;
        }
        
    }
}



var _push = keyboard_check_pressed(vk_escape) || Gamepad.Back || (scr_check_back_text() && mouse_check_button_pressed(mb_left));
if (_push)
{
    snd_play_once(menu_select);
    obj_menu.activated = true;
    with (obj_menu) splashline = splashlines[abs(a_rand()) % array_length_1d(splashlines)];
    activated = false;
    saveGame();
}

