/// @description scr_check_back_text()
if (object_index == obj_menu_start_game && obj_menu_start_game.mode > 0) return false;
var _mx = mouse_x;
var _my = mouse_y;
var _x = SCREEN_WIDTH - 333;
var _y = SCREEN_HEIGHT - 43;

if ((_mx > _x) && (_mx < SCREEN_WIDTH) && (_my > _y) && (_my < SCREEN_HEIGHT))
    return true;
else
    return false;
