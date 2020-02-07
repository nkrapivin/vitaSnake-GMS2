/// @description draw_text_vita2d(pos,x,y,size,text)
/// @param pos
/// @param x
/// @param y
/// @param size
/// @param text
var _p    = argument0;
var _size = argument3 * FONT_SCALE;
var _x    = argument1;
var _y    = argument2;
var _text = argument4;
draw_set_font_manager(_size);
var _w = string_width(string_hash_to_newline(_text));
var _h = string_height(string_hash_to_newline(_text));

switch (_p)
{
    default:         draw_text(_x, _y, string_hash_to_newline(_text));                   break;
    case centered:   draw_text(_x - (_w/2), _y + (_h/2), string_hash_to_newline(_text)); break;
    case centeredX:  draw_text(_x - (_w/2), _y, string_hash_to_newline(_text));          break;
    case centeredY:  draw_text(_x, _y + (_h/2), string_hash_to_newline(_text));          break;
    case alignRight: draw_text(_x - _w, _y, string_hash_to_newline(_text));              break;
}
