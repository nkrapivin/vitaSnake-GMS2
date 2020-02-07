/// @description draw_selectable_vita2d(name,y)
/// @param name
/// @param y
var _name = argument0;
var _y = argument1;
var _text_width = 0;
draw_text_vita2d(centeredX, ITEM_X, _y, 30, _name);
_text_width = string_width(string_hash_to_newline(_name));
return _text_width;
