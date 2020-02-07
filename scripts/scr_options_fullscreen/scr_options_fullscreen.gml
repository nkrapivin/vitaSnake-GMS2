/// @description scr_options_fullscreen()

var _f1 = global.ENABLE_FULLSCREEN;
var _f2 = window_get_fullscreen();

if (_f1 != _f2) //need to trigger fullscreen
{
    window_set_fullscreen(global.ENABLE_FULLSCREEN);
}
