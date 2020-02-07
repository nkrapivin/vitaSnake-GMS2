xMid = x;
yMid = y;

if (global.ENABLE_ANIMATION)
{
    image_angle = sin( animation_step ) * pi/10;
    animation_step += ANIMATION_SPEED * 1;
    
    if( animation_step > 2*pi )
        animation_step -= 2*pi;
}
else image_angle = 0;

draw_sprite_ext(sprite_index,image_index,x,y,1,1,-radtodeg(image_angle),-1,1);

if (global.ENABLE_PARTICLES)
{
    // Replace old "shimmering" particles and render
    for( var i = 0; i < TOTAL_PARTICLES; ++i )
    {
        if( particles[i].is_dead )
        {
            instance_destroy(particles[i]);
            var _x = x + a_rand() % COLLECT_WIDTH - (COLLECT_WIDTH/2);
            var _y = y + a_rand() % COLLECT_HEIGHT - (COLLECT_HEIGHT/2);
            particles[i] = instance_create_layer(_x,_y,layer,obj_particle);
        }
        
        with (particles[i]) event_perform(ev_draw,0);
    }
	
	// Remove "explosion" particles if they're all dead
	for( var i = 0; i < array_length_1d(explosionParticles); ++i )
	{
		if( explosionParticles[i] != noone && !explosionParticles[i].is_dead ) continue;

		if( i == array_length_1d(explosionParticles)-1 )
		{
			explosionParticles = 0;
			explosionParticles = array_create(MAX_EXPLOSION_PARTICLES, noone);
		}
	}
	
	// Move "explosion particles" and render
	for( var i = 0; i < array_length_1d(explosionParticles); ++i )
	{
		if (!instance_exists(explosionParticles[i])) continue;
		// We only render living paricles
		if( !explosionParticles[i].is_dead )
		{

			// Some dumb math to find a different texture part for each particle
			var formulaX = ( i % sqrt(MAX_EXPLOSION_PARTICLES) ) * ( sprite_width / sqrt(MAX_EXPLOSION_PARTICLES) );
			var formulaY = ( i / sqrt(MAX_EXPLOSION_PARTICLES) ) * ( sprite_height / sqrt(MAX_EXPLOSION_PARTICLES) );

			// We don't want to use the rim of the texture for particles, since it's likely that it's blank
			var texturePartX = ( formulaX * 0.6 ) + sprite_width * 0.2;
			var texturePartY = ( formulaY * 0.6 ) + sprite_height * 0.2;

			with (explosionParticles[i])
			{
				a = 255;
				if( lifespan > ( 0.8 * MAX_LIFE ) )
					a = ( -lifespan + MAX_LIFE ) * ALPHA_MULT;
				
				draw_sprite_part_ext(other.sprite_index,other.image_index,texturePartX,texturePartY,6,6,x,y,1,1,-1,a*(1/255));
				lifespan += 1;
			}
		}
	}
}


draw_text_vita2d( alignRight, SCREEN_WIDTH - padding_side, padding_top, text_size, "SCORE: " + string(score) );
draw_text_vita2d( alignRaw, padding_side, padding_top, text_size, "HIGHSCORE: " + string(global.stats_Highscores[global.GAME_MODE,global.GAME_DIFFICULTY]) );
if (global.GAME_MODE == 1)
	draw_text_vita2d( centeredX, SCREEN_WIDTH/2, 35, font_size, time_format_trial(trialtimer/game_get_speed(gamespeed_fps)));