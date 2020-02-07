draw_set_alpha(100*(1/255));
draw_rectangle_vita2d( 0, item[0].y + BUTTON_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - item[0].y - BUTTON_HEIGHT - 2, make_colour_rgb( 0, 0, 0 ) );
draw_rectangle_vita2d( 0, item[0].y + 1, item[0].x, BUTTON_HEIGHT - 2, make_colour_rgb( 0, 0, 0 ) );
draw_rectangle_vita2d( item[0].x + BUTTON_WIDTH, item[0].y + 1, item[1].x - item[0].x - BUTTON_WIDTH, BUTTON_HEIGHT - 2, make_colour_rgb( 0, 0, 0 ) );
draw_rectangle_vita2d( item[1].x + BUTTON_WIDTH, item[0].y + 1, SCREEN_WIDTH - item[1].x - BUTTON_WIDTH, BUTTON_HEIGHT - 2, make_colour_rgb( 0, 0, 0 ) );
if ( cursor == 0 ) draw_rectangle_vita2d( item[1].x, item[1].y, BUTTON_WIDTH, BUTTON_HEIGHT, make_colour_rgb( 0, 0, 0 ) );
else draw_rectangle_vita2d( item[0].x, item[0].y, BUTTON_WIDTH, BUTTON_HEIGHT, make_colour_rgb( 0, 0, 0 ) );
draw_rectangle_vita2d( 0, 0, SCREEN_WIDTH, item[0].y, make_colour_rgb( 0, 0, 0 ) );

draw_set_alpha(fadeInValue*(1/255));
draw_rectangle_vita2d( 0, bannerY, SCREEN_WIDTH, bannerH, make_colour_rgb( 0, 0, 0 ) );
draw_set_alpha(1);

// Draw border with color based on theme
draw_rectangle_vita2d( 0, bannerY, SCREEN_WIDTH, borderThickness, MAIN_FONT_COLOR );
draw_rectangle_vita2d( 0, bannerY+bannerH-borderThickness, SCREEN_WIDTH, borderThickness, MAIN_FONT_COLOR );

draw_set_alpha(fadeInValue*(1/255));
draw_set_color(make_colour_rgb( 255, 255, 255 ));
draw_text_vita2d( centeredX, SCREEN_WIDTH/2, gameOverTextY, gameOverTextSize, "Game Over" );
draw_set_alpha(1);

for (var i = 0; i < MENU_ITEMS_GAMEOVER; i++)
{
	textColor = MAIN_FONT_COLOR;
	textColor = textColor << 8;
	textColor = textColor >> 8;
	fade = fadeInValue << 24;
	textColor += fade;
	
	draw_set_color(textColor);
	
	draw_set_alpha( ((fadeInValue*50)/255)*(1/255) );
	draw_rectangle_vita2d( item[i].x, item[i].y, BUTTON_WIDTH, BUTTON_HEIGHT, make_colour_rgb( 30, 30, 30 ) );
	draw_set_alpha(1);
	
	if (i == cursor)
	{
		draw_rectangle_vita2d( item[i].x, item[i].y, BUTTON_WIDTH, border_thickness, textColor );
		draw_rectangle_vita2d( item[i].x + BUTTON_WIDTH - border_thickness, item[i].y, border_thickness, BUTTON_HEIGHT, textColor );
		draw_rectangle_vita2d( item[i].x, item[i].y + BUTTON_HEIGHT - border_thickness, BUTTON_WIDTH, border_thickness, textColor );
		draw_rectangle_vita2d( item[i].x, item[i].y, border_thickness, BUTTON_HEIGHT, textColor );
	}
	
	draw_text_vita2d( centered, item[i].x + (BUTTON_WIDTH/2), item[i].y + (BUTTON_HEIGHT/2), fontSize, item[i].name );
}

textSize = 40;
draw_set_color(make_colour_rgb(255, 255, 255));
draw_set_alpha(fadeInValue*(1/255));
draw_text_vita2d( centeredX, SCREEN_WIDTH/2, scoreTextY, textSize, "Your score: " + string(score) );

textSize = 30;
if (global.IsHighscore)
{
	draw_set_color(make_colour_rgb(255, 215, 0));
	draw_text_vita2d( centeredX, SCREEN_WIDTH / 2, newHighscoreY, textSize, "NEW HIGHSCORE!" );
	draw_set_alpha(1);
}
textSize = 42;

if (fadeInValue < 255) fadeInValue += fadeInSpeed * 1;
else if (fadeInValue > 255) fadeInValue = 255;