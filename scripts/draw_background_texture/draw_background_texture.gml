/// @description draw_background_texture(bgid)
/// @param bgid
var _bgid = argument0;

if (_bgid != 3)
    draw_sprite_tiled_ext(spr_backgrounds,_bgid,0,0,2,2,-1,1);
else
    draw_sprite(spr_background_rpphs,0,0,0);
    
if (global.GAME_DIFFICULTY)
{
    BORDER_THICKNESS = 3;
    COLOR_CYCLE_SPEED = 3;
    
    if (_bgid == 2) border_color = MAIN_FONT_COLOR;
    else
    {
        // Change the color of the border for dramatic effect
        if( border_red >= 254 )
        {
            border_red = 255;
            color_plus = false;
        }
        else if( border_red <= 170 )
        {
            border_red = 170;
            color_plus = true;
        }
        
        if( color_plus )
            border_red += COLOR_CYCLE_SPEED * 1;
        else
            border_red -= COLOR_CYCLE_SPEED;
            
        border_color = make_colour_rgb(border_red,0,0);
        
    }
    
    // Draw a border
    draw_rectangle_vita2d( 0, 0, SCREEN_WIDTH, BORDER_THICKNESS, border_color );
    draw_rectangle_vita2d( SCREEN_WIDTH - BORDER_THICKNESS, 0, BORDER_THICKNESS, SCREEN_HEIGHT, border_color );
    draw_rectangle_vita2d( 0, SCREEN_HEIGHT - BORDER_THICKNESS, SCREEN_WIDTH, BORDER_THICKNESS, border_color );
    draw_rectangle_vita2d( 0, 0, BORDER_THICKNESS, SCREEN_HEIGHT, border_color );
}
