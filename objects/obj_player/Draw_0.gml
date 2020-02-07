// Render tail first
var _a = scr_get_snake_part(global.PLAYER_TEXTURES,0);
draw_sprite_ext( _a[0], _a[1], snakeParts[ array_length_1d(snakeParts)-1 ].x, snakeParts[ array_length_1d(snakeParts)-1 ].y, 1, 1, -radtodeg(snakeParts[ array_length_1d(snakeParts)-1 ].r), -1, 1 );

// Render the body parts from tail to head, but don't bother drawing the snake parts if it's too long
for( var i = array_length_1d(snakeParts)-2; i > 0; --i )
{
    // but don't bother drawing the snake parts if it's too long
    if( i < 1000)
    // Draw snakePart only if it doesn't overlap
        if( snakeParts[ i ].x != snakeParts[ i-1 ].x || snakeParts[ i ].y != snakeParts[ i-1 ].y )
            draw_sprite_ext( _a[0], 1, snakeParts[ i ].x, snakeParts[ i ].y, 1, 1, -radtodeg(snakeParts[ i ].r), -1, 1 );
}


// Render the head
if( isClose )
    draw_sprite_ext( _a[0], 3, snakeParts[ 0 ].x, snakeParts[ 0 ].y, 1, 1, -radtodeg(snakeParts[ 0 ].r), -1, 1 );
else
    draw_sprite_ext( _a[0], 2, snakeParts[ 0 ].x, snakeParts[ 0 ].y, 1, 1, -radtodeg(snakeParts[ 0 ].r), -1, 1 );

