if (counttime) timer++;

if (global.GAME_MODE == 1 && trialcount)
{
	if (trialtimer > 0 && !instance_exists(obj_pauser)) trialtimer--;
	if (trialtimer == 0) trialdied = true;
}

if (checkOpenDistance())
{
    obj_player.isClose = true;
    
    if (checkCollision())
    {
        snd_play_once(snd_bite);
        global.stats_applesEaten++;
        if (global.GAME_MODE == 2)
            obj_player.speed_mod *= obj_player.SPEED_UP_MODIFIER;
        
		if( global.ENABLE_PARTICLES )
		{
			// Explode the apple
			for( var i = 0; i < MAX_EXPLOSION_PARTICLES; ++i )
			{
				var _x = ((obj_player.snakeParts[0]).x + sin( (obj_player.snakeParts[0]).r ) * 20) + (COLLECT_WIDTH/2);
				var _y = ((obj_player.snakeParts[0]).y - cos( (obj_player.snakeParts[0]).r ) * 20) + (COLLECT_HEIGHT/2);
				var _r;
				var randSide = a_rand() % 2;
				if( randSide == 0 )
					_r = (obj_player.snakeParts[0]).r + ( (pi/2) + (a_rand() % 2 - 1)*(pi/10) );
				else
					_r = (obj_player.snakeParts[0]).r - ( (pi/2) + (a_rand() % 2 - 1)*(pi/10) );

				explosionParticles[i] = instance_create_layer(_x,_y,layer,obj_particle);
				with (explosionParticles[i])
				{
					image_angle = _r;
					move = true;
				}

				//explosionParticles.push_back( new Particle( newParticlePos ) );
			}
		}
		
        x = a_rand() % SCREEN_WIDTH*0.8 + SCREEN_WIDTH*0.1;
        y = a_rand() % SCREEN_HEIGHT*0.8 + SCREEN_HEIGHT*0.1;
        
        score += SCORE_ADD;
        var _p_to_add;
        if (global.GAME_MODE == 3)
        {
            show_debug_message("fibonacci");
            if (score < 16)
                _p_to_add = fibonacci[score];
            else
                _p_to_add = fibonacci[15];
                
            show_debug_message("p " + string(fibonacci[10]));
        }
        else _p_to_add = 1;
        
        repeat (_p_to_add)
        {
            with (obj_player)
            {
                var _p = array_length_1d(snakeParts);
                snakeParts[_p] = newPart(snakeParts[_p-1].x,snakeParts[_p-1].y,snakeParts[_p-1].r);
                show_debug_message("added");
            }
        }
    }
}
else obj_player.isClose = false;

if ((obj_player.shouldDie || obj_player.tailCollide || (global.GAME_MODE == 1 && trialdied)) && !died)
{
	died = true;
	trialdied = false;
	trialcount = false;
	snd_play_once(snake_death);
	counttime = false;
	global.stats_totalDeaths++;
	global.stats_timePlayed += (timer / game_get_speed(gamespeed_fps));
	var cur_score = global.stats_Highscores[global.GAME_MODE,global.GAME_DIFFICULTY];
	if (score > cur_score)
	{
		global.stats_Highscores[global.GAME_MODE,global.GAME_DIFFICULTY] = score;
		global.IsHighscore = true;
	}
	saveGame();
	
	instance_create_layer(0,0,global._ZLayer,obj_game_over);
	obj_player.paused = true;
	Touchpad.activated = false;
}

//Pausing

var _push = keyboard_check_pressed(vk_escape) || Gamepad.Pause;
if (_push && !died && !instance_exists(obj_pauser))
{
	instance_create_layer(0,0,global._ZLayer,obj_pauser);
	obj_player.paused = true;
	Touchpad.activated = false;
}