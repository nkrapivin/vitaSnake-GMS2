scr_options_update_textures();

if (!activated) exit;

draw_set_alpha(1);

draw_text_vita2d( centeredX, SCREEN_WIDTH / 2, 70, 60, "Options" );
draw_text_vita2d( alignRaw, 20, option[ 0 ].slct_y, 30, option[ 0 ].name );

switch( option[ 0 ].selected )
{
    case 0:
    {
        text_width = draw_selectable_vita2d( "Classic", option[ 0 ].slct_y );
        draw_text_vita2d( alignRaw, DESC_X, option[ 0 ].slct_y - 20, optionsFontSize, !global.IsMobile ? "Use arrow keys or" : "Press on left or right side" );
        draw_text_vita2d( alignRaw, DESC_X, option[ 0 ].slct_y + 10, optionsFontSize, !global.IsMobile ? "WASD to turn the snake." : "of the screen to turn the snake." );
        break;
    }
    case 1:
    {
        text_width = draw_selectable_vita2d( "Simplified", option[ 0 ].slct_y );
        draw_text_vita2d( alignRaw, DESC_X, option[ 0 ].slct_y - 20, optionsFontSize, !global.IsMobile ? "Use arrow keys or WASD" : "The snake will follow" );
        draw_text_vita2d( alignRaw, DESC_X, option[ 0 ].slct_y + 10, optionsFontSize, !global.IsMobile ? "to control direction of the snake" : "your finger" );
        break;
    }
    default: break;
}
if (cursor == 0) scr_options_draw_cursor( option[ cursor ], text_width );

for ( var i = 1; i < MENU_ITEMS_OPTIONS-2; ++i )
{
    draw_text_vita2d( alignRaw, 20, option[ i ].slct_y, optionsNameSize, option[ i ].name );
    switch( i )
    {
        case 1:
        text_width = draw_selectable_vita2d( snakeTexturesN[ option[ i ].selected ], option[ i ].slct_y );
        break;
        case 2:
        text_width = draw_selectable_vita2d( bgTexturesN[ option[ i ].selected ], option[ i ].slct_y );
        break;
        case 3:
        text_width = draw_selectable_vita2d( collectableTexturesN[ option[ i ].selected ], option[ i ].slct_y );
        break;
        default: break;
    }
    if (cursor == i) scr_options_draw_cursor( option[ cursor ], text_width );
}

for (var i = 0; i < 3; ++i)
{
    var _arr = scr_get_snake_part(global.PLAYER_TEXTURES, i);
    draw_sprite_ext(_arr[0], _arr[1], DESC_X + (i * 30) + 15, option[ 1 ].slct_y - 15, 1, 1, -radtodeg(pi / 2), -1, 1);
}

draw_sprite_ext(spr_apples, global.APPLE_TEXTURE, apple_xmid, apple_ymid, 1, 1, radtodeg(apple_r), -1, 1);
if (global.ENABLE_PARTICLES && !obj_menu.activated)
{
    for (var i = 0; i < TOTAL_PARTICLES; ++i)
    {
        if (!instance_exists(particles[i]))
        {
            particles[i] = instance_create_layer(0,0,global._PLayer,obj_particle);
            with (particles[i])
            {
                x = other.apple_x + (30/2) + a_rand() % 30 - (30/2);
                y = other.apple_y + (30/2) + a_rand() % 30 - (30/2);
            }
        }
        else
        {
            with (particles[i])
            {
                if (is_dead) instance_destroy();
                else event_perform(ev_draw,0);
            }
        }
    }
} else for (var i = 0; i < TOTAL_PARTICLES; ++i) instance_destroy(particles[i]);

// Collectable effects selectable
draw_text_vita2d( alignRaw, 20, option[ 4 ].slct_y, optionsNameSize, option[ 4 ].name );
switch( option[ 4 ].selected )
{
    case 0:
    {
        text_width = draw_selectable_vita2d( "On", option[ 4 ].slct_y );
        break;
    }
    case 1:
    {
        text_width = draw_selectable_vita2d( "Off", option[ 4 ].slct_y );
        break;
    }
    default: break;
}
if(cursor == 4) scr_options_draw_cursor( option[ cursor ], text_width );

// Rear touch selectable
draw_text_vita2d( alignRaw, 20, option[ 5 ].slct_y, optionsNameSize, option[ 5 ].name );
switch( option[ 5 ].selected )
{
    case 0:
    {
        text_width = draw_selectable_vita2d( "On", option[ 5 ].slct_y );
        break;
    }
    case 1:
    {
        text_width = draw_selectable_vita2d( "Off", option[ 5 ].slct_y );
        break;
    }
    default: break;
}
if (cursor == 5) scr_options_draw_cursor( option[ cursor ], text_width );

scr_draw_back_text();

