
if (!activated) exit;


if (mode == 0)
{
    draw_set_alpha(50*(1/255));
    draw_rectangle_vita2d( 10, 10, margin_x+BUTTON_WIDTH+margin_x-20, SCREEN_HEIGHT-20, make_colour_rgb(0, 0, 0) );
    draw_set_alpha(1);
    
    draw_text_vita2d( alignRight, SCREEN_WIDTH - margin_x, 100, text_size , "Choose a game mode" );
    
    for (var i = 0; i < MENU_ITEMS_START; i++)
    {
        draw_set_alpha(100*(1/255));
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
    
    draw_set_alpha(50*(1/255));
    draw_rectangle_vita2d( desc_x-20, desc_y-40, 454, 270, make_colour_rgb(0, 0, 0) );
    draw_set_alpha(1);
    
    switch( cursor )
    {
        // Classic
        case 0:
        {
            draw_text_vita2d( alignRaw, desc_x, desc_y, font_size, "Play vitaSnake the" );
            draw_text_vita2d( alignRaw, desc_x, desc_y + 30, font_size, "classic way!" );
            break;
        }
        // Time Trial
        case 1:
        {
            draw_text_vita2d( alignRaw, desc_x, desc_y, font_size, "It's a desparate race" );
            draw_text_vita2d( alignRaw, desc_x, desc_y + 30, font_size, "against the time," );
            draw_text_vita2d( alignRaw, desc_x, desc_y + 60, font_size, "collect as many points" );
            draw_text_vita2d( alignRaw, desc_x, desc_y + 90, font_size, "as possible within a 30" );
            draw_text_vita2d( alignRaw, desc_x, desc_y + 120, font_size, "second time limit!" );
            break;
        }
        // Hyper
        case 2:
        {
            draw_text_vita2d( alignRaw, desc_x, desc_y, font_size, "The snake starts slow," );
            draw_text_vita2d( alignRaw, desc_x, desc_y + 30, font_size, "but gets faster with." );
            draw_text_vita2d( alignRaw, desc_x, desc_y + 60, font_size, "each point." );
            break;
        }
        // Fibonacci
        case 3:
        {
            draw_text_vita2d( alignRaw, desc_x, desc_y, font_size, "Instead of only growing");
            draw_text_vita2d( alignRaw, desc_x, desc_y + 30, font_size, "by one piece, each");
            draw_text_vita2d( alignRaw, desc_x, desc_y + 60, font_size, "time the snake gets");
            draw_text_vita2d( alignRaw, desc_x, desc_y + 90, font_size, "longer by a number");
            draw_text_vita2d( alignRaw, desc_x, desc_y + 120, font_size, "determined by the");
            draw_text_vita2d( alignRaw, desc_x, desc_y + 150, font_size, "Fibonacci sequence.");
            break;
        }
        // Lazy
        case 4:
        {
            draw_text_vita2d( alignRaw, desc_x, desc_y, font_size, "The snake got lazy,  ");
            draw_text_vita2d( alignRaw, desc_x, desc_y + 30, font_size, "so it won't move");
            draw_text_vita2d( alignRaw, desc_x, desc_y + 60, font_size, "on it's own.");
            draw_text_vita2d( alignRaw, desc_x, desc_y + 90, font_size, "Drag it by the head");
            draw_text_vita2d( alignRaw, desc_x, desc_y + 120, font_size, "with your finger.");
            break;
        }
        
        default: break;
    }
    
    scr_draw_back_text();
}
else if (mode == 1)
{
    font_size = 60;
    
    draw_text_vita2d( centeredX, SCREEN_WIDTH/2, 110, font_size, "Choose the difficulty" );
    
    font_size = 35;
    draw_text_vita2d( centeredX, SCREEN_WIDTH/2, 160, font_size, "Mode: " + scr_get_mode_name() );
    
    for (var i = 0; i < MENU_ITEMS_DIFFICULTY; i++)
    {
        draw_set_alpha(100*(1/255));
        draw_rectangle_vita2d( itemd[i].x, itemd[i].y, BUTTON_WIDTH, BUTTON_HEIGHT, make_colour_rgb( 30, 30, 30 ) );
        draw_set_alpha(1);
        
        if (i == cursord)
        {
            draw_rectangle_vita2d( itemd[i].x, itemd[i].y, BUTTON_WIDTH, border_thickness, MAIN_FONT_COLOR );
            draw_rectangle_vita2d( itemd[i].x + BUTTON_WIDTH - border_thickness, itemd[i].y, border_thickness, BUTTON_HEIGHT, MAIN_FONT_COLOR );
            draw_rectangle_vita2d( itemd[i].x, itemd[i].y + BUTTON_HEIGHT - border_thickness, BUTTON_WIDTH, border_thickness, MAIN_FONT_COLOR );
            draw_rectangle_vita2d( itemd[i].x, itemd[i].y, border_thickness, BUTTON_HEIGHT, MAIN_FONT_COLOR );
        }
        
        draw_text_vita2d( centered, itemd[i].x + (BUTTON_WIDTH/2), itemd[i].y + (BUTTON_HEIGHT/2), textSize, itemd[i].name );
    }
    
    font_size = 30;
    
    var _arr = scr_get_snake_part(global.PLAYER_TEXTURES,1);
    
    switch( cursord )
    {
        case 0:
        {
            draw_text_vita2d( centeredX, SCREEN_WIDTH/2, 430, font_size, "Collect as many apples as you can," );
            draw_text_vita2d( centeredX, SCREEN_WIDTH/2, 470, font_size, "just don't bite your tail!" );
            
            //draw snek
            
            draw_sprite_ext( _arr[0], 1, SCREEN_WIDTH - ( SCREEN_HEIGHT*0.04 ), SCREEN_HEIGHT - ( SCREEN_HEIGHT*0.04 ), 2.3, 2.3, -radtodeg(( -45 * pi ) / 180), -1, 1 );
            draw_sprite_ext( _arr[0], 2, SCREEN_WIDTH - ( SCREEN_HEIGHT*0.14 ), SCREEN_HEIGHT - ( SCREEN_HEIGHT*0.14 ), 2.5, 2.5, -radtodeg(( -45 * pi ) / 180), -1, 1 );
            
            break;
        }
        case 1:
        {
            draw_text_vita2d( centeredX, SCREEN_WIDTH/2, 430, font_size, "Recommended for experienced players," );
            draw_text_vita2d( centeredX, SCREEN_WIDTH/2, 470, font_size, "touching the game border kills the snake." );
            
            draw_sprite_ext( _arr[0], 1, SCREEN_WIDTH - ( SCREEN_HEIGHT*0.04 ), SCREEN_HEIGHT - ( SCREEN_HEIGHT*0.04 ), 2.3, 2.3, -radtodeg(( -45 * pi ) / 180), -1, 1 );
            draw_sprite_ext( _arr[0], 4, SCREEN_WIDTH - ( SCREEN_HEIGHT*0.14 ), SCREEN_HEIGHT - ( SCREEN_HEIGHT*0.14 ), 2.5, 2.5, -radtodeg(( -45 * pi ) / 180), -1, 1 );
            
            break;
        }
        default: break;
    }
	
	draw_text_vita2d( alignRaw, 660, 250, scoreSize, "HIGH: " + string(global.stats_Highscores[global.GAME_MODE,0]) );
    draw_text_vita2d( alignRaw, 660, 350, scoreSize, "HIGH: " + string(global.stats_Highscores[global.GAME_MODE,1]) );
}

