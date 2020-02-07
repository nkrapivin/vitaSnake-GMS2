/// @description scr_get_snake_part(mode,part)
/// @param mode
/// @param part

// returns an array [sprite_referrence,image_index]

//mode - default/classic/rpphs/nokia (0/1/2/3)
//part - tail/body/head/headbite/headAngry (0/1/2/3/4)

var _mode = argument0;
var _part = argument1;

var __return_arr = array_create(2);

switch (_mode)
{
    case 0: __return_arr[0] = spr_snake_default; break;
    case 1: __return_arr[0] = spr_snake_classic; break;
    case 2: __return_arr[0] = spr_snake_rpphs; break;
    case 3: __return_arr[0] = spr_snake_nokia; break;
    default: break;
}

__return_arr[1] = _part;

return __return_arr;
