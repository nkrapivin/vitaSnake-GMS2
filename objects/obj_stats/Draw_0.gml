if (!activated) exit;

//The stats themselves
if (mode == 0)
{
    draw_text_vita2d( centeredX, SCREEN_WIDTH / 2, headerHeight, headerFontSize, "Extras" );
    
    scr_draw_stats((SCREEN_WIDTH/2) - horizontalSpacing, statsHeight, global.stats_applesEaten, "Apples eaten" );
    scr_draw_stats((SCREEN_WIDTH/2), statsHeight, time_format(global.stats_timePlayed), "Time spent playing" );
    scr_draw_stats((SCREEN_WIDTH/2) + horizontalSpacing, statsHeight, global.stats_totalDeaths, "Total deaths" );
    
    for (var i = 0; i < MENU_ITEMS_STATS; i++)
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
}
if (mode == 1) //how to play
{
    textSize = 20;
    
    draw_text_vita2d( centeredX, SCREEN_WIDTH/ 2, 40, 35, "How to play" );
    
    draw_text_vita2d( alignRaw, 15, 100, textSize, "Your goal in this game is to eat as many apples as you can," );
    draw_text_vita2d( alignRaw, 15, 130, textSize, "each apple eaten adds a point to your score." );
    draw_text_vita2d( alignRaw, 15, 160, textSize, "Avoid biting your own tail, or you will lose the game." );
    
    draw_text_vita2d( alignRaw, 15, 260, textSize, "- The snake moves forward by itself." );
    draw_text_vita2d( alignRaw, 15, 310, textSize, "- Use the left stick, DPAD or touch to control the snake" );
    draw_text_vita2d( alignRaw, 15, 360, textSize, "- You can boost the snake's speed by holding the (NONE) button." );
    
    draw_text_vita2d( alignRaw, 15, 440, textSize, "- Pause the game with the START button." );
    
    textSize = 42;
    
}
if (mode == 2) //credits
{
    draw_text_vita2d( centeredX, SCREEN_WIDTH/ 2, 40, 30, "VitaSnake is a game made by Grzybojad" );
    
    draw_text_vita2d( alignRaw, 15, 90, creditsSize, "Texture credits:" );
    draw_text_vita2d( alignRaw, 15, 120, creditsSize, "- Livearea, default snake, apple and mushroom textures by JumboCube" );
    draw_text_vita2d( alignRaw, 15, 150, creditsSize, "- RPPHS snake and apple textures by MotoLegacy" );
    draw_text_vita2d( alignRaw, 15, 180, creditsSize, "- Desert tile from Whispers of Avalon: Desert Tileset by Leonard Pabin" );
    draw_text_vita2d( alignRaw, 15, 210, creditsSize, "- Button symbols from 'No dead folk!'" );
    
    draw_text_vita2d( alignRaw, 15, 260, creditsSize, "Sound effect credits:" );
    draw_text_vita2d( alignRaw, 15, 290, creditsSize, "- RPG Sound Pack by artisticdude" );
    draw_text_vita2d( alignRaw, 15, 320, creditsSize, "- The Essential Retro Video Game Sound Effects Collection By Juhani Junkala" );
    
    draw_text_vita2d( alignRaw, 15, 370, creditsSize, "Special thanks to:" );
    draw_text_vita2d( alignRaw, 15, 400, creditsSize, "- all VitaSDK contributors" );
    draw_text_vita2d( alignRaw, 15, 430, creditsSize, "- Nik the Cat for libVita2D -> draw_ functions." );
    draw_text_vita2d( alignRaw, 15, 460, creditsSize, "- Everyone who helped me on Discord" );
    
    draw_text_vita2d( alignRaw, 15, 500, creditsSize, "And thank You for playing vitaSnake!" );
}

scr_draw_back_text();


//menu shit



