draw_background_texture(global.BGID);
global.__mainfontcol = draw_set_color_manager(0, global.BGID);
draw_set_color(MAIN_FONT_COLOR);

if (!activated) exit;
draw_text_vita2d(centeredX, (SCREEN_WIDTH/2), logoPosX, logoSize, "vitaSnake");
draw_text_vita2d(centeredX, SCREEN_WIDTH/2 + 8, logoPosX + 28, font_size, splashline);

draw_text_vita2d( alignRaw, 10, SCREEN_HEIGHT - 10, 24, "version: " + VERSION );

for (var i = 0; i < MENU_ITEMS_MAIN; i++)
{
    draw_set_alpha(100*(1/255));
    draw_rectangle_vita2d(item[i].x, item[i].y, BUTTON_WIDTH, BUTTON_HEIGHT, make_colour_rgb(30,30,30));
    draw_set_alpha(1);
    
    if (cursor == i)
    {
       draw_rectangle_vita2d(item[i].x, item[i].y, BUTTON_WIDTH, border_thickness, MAIN_FONT_COLOR);
       draw_rectangle_vita2d(item[i].x + BUTTON_WIDTH - border_thickness, item[i].y, border_thickness, BUTTON_HEIGHT, MAIN_FONT_COLOR);
       draw_rectangle_vita2d(item[i].x, item[i].y + BUTTON_HEIGHT - border_thickness, BUTTON_WIDTH, border_thickness, MAIN_FONT_COLOR);
       draw_rectangle_vita2d(item[i].x, item[i].y, border_thickness, BUTTON_HEIGHT, MAIN_FONT_COLOR);
    }
	
	draw_text_vita2d( centered, item[i].x + (BUTTON_WIDTH/2), item[i].y + (BUTTON_HEIGHT/2), textSize, item[i].name );
}

