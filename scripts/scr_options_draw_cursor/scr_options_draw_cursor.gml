/// @description scr_options_draw_cursor(i,text_width)
/// @param i
/// @param text_width

var _r,_g,_b,_a,_i,_tw,_color;
_r = 0;
_g = 0;
_b = 0;
_a = 100;
_i = argument0;
_tw = argument1;

switch( global.BGID )
{
    case 0:// Desert
    _r = 0; _g = 0; _b = 0; _a = 100;
    break;
    
    case 1:// Classic
    _r = 255; _g = 255; _b = 0; _a = 40;
    break;
    
    case 2:// Nokia
    _r = 40; _g = 45; _b = 34; _a = 40;
    break;
    
    case 3:// RPPHS
    _r = 0; _g = 255; _b = 0; _a = 40;
    break;
}

draw_set_alpha(_a * (1/255));

_color = make_color_rgb(_r,_g,_b);
draw_rectangle_vita2d( _i.slct_x - (_tw / 2) - 20, _i.slct_y - 30, _tw + 40, 40, _color );

draw_set_alpha(1);
