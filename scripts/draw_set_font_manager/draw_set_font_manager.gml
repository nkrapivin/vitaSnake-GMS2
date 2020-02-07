/// @description draw_set_font_manager(size)
/// @param size
var _size;
if (os_browser == browser_not_a_browser || webgl_enabled) _size = floor(argument0 * 72 / 96); // pixels to points
else _size = argument0; //HTML5 with NO WebGL!

if (!ds_map_exists(font_main, argument0))
{
    font_main[? argument0] = font_add(webgl_enabled ? "font_main.ttf" : "Emulogic", _size, false, false, 32, 128);
    show_debug_message("size "+string(_size));
}

if (!webgl_enabled) font_set_cache_size(font_main[? argument0], 8);

draw_set_font(font_main[? argument0]);
