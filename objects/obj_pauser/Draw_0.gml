draw_set_alpha(40*(1/255));
draw_rectangle_vita2d( 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, make_colour_rgb(0,0,0) );
draw_set_alpha(1);

draw_text_vita2d( centeredX, SCREEN_WIDTH/2, 110, 60, "Paused" );

for (var i = 0; i < MENU_ITEMS_PAUSE; i++)
{
	draw_set_alpha(50*(1/255));
	draw_rectangle_vita2d( item[i].x, item[i].y, BUTTON_WIDTH, BUTTON_HEIGHT, make_colour_rgb( 30, 30, 30 ) );
	draw_set_alpha(1);
	
	if (i == cursor)
	{
		draw_rectangle_vita2d( item[i].x, item[i].y, BUTTON_WIDTH, border_thickness, MAIN_FONT_COLOR );
		draw_rectangle_vita2d( item[i].x + BUTTON_WIDTH - border_thickness, item[i].y, border_thickness, BUTTON_HEIGHT, MAIN_FONT_COLOR );
		draw_rectangle_vita2d( item[i].x, item[i].y + BUTTON_HEIGHT - border_thickness, BUTTON_WIDTH, border_thickness, MAIN_FONT_COLOR );
		draw_rectangle_vita2d( item[i].x, item[i].y, border_thickness, BUTTON_HEIGHT, MAIN_FONT_COLOR );
	}
	
	draw_text_vita2d( centered, item[i].x + (BUTTON_WIDTH/2), item[i].y + (BUTTON_HEIGHT/2), textSize, item[i].name );
}

var _a = scr_get_snake_part(global.PLAYER_TEXTURES,1);
draw_sprite_ext(_a[0],_a[1],SCREEN_WIDTH - (SCREEN_HEIGHT*0.04),SCREEN_HEIGHT - (SCREEN_HEIGHT*0.04),2.3,2.3,-radtodeg((-45 * pi) / 180),-1,1);
draw_sprite_ext(_a[0],_a[1]+1,SCREEN_WIDTH - (SCREEN_HEIGHT*0.14),SCREEN_HEIGHT - (SCREEN_HEIGHT*0.14),2.5,2.5,-radtodeg((-45 * pi) / 180),-1,1);