/// @description scr_draw_stats(x,y,statData,statName)
/// @param x
/// @param y
/// @param statData
/// @param statName
var _x = argument0;
var _y = argument1;
draw_text_vita2d( centeredX, _x, _y, statsFontSize, string(argument2) );
draw_text_vita2d( centeredX, _x, _y + verticalSpacing, descFontSize, string(argument3) );
