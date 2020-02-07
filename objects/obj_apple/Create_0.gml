image_speed = 0;
image_index = global.APPLE_TEXTURE;
Touchpad.activated = true;
SCORE_ADD = 1;
COLLECT_WIDTH = 30;
COLLECT_HEIGHT = 30;
COLLISION_DISTANCE = 30;
OPEN_DISTANCE = 100;
MAX_EXPLOSION_PARTICLES = 8;
fibonacci = scr_fibonacci();
x = a_rand() % SCREEN_WIDTH*0.8 + SCREEN_WIDTH*0.1;
y = a_rand() % SCREEN_HEIGHT*0.8 + SCREEN_HEIGHT*0.1;

explosionParticles = array_create(MAX_EXPLOSION_PARTICLES, noone);

for( var i = 0; i < TOTAL_PARTICLES; ++i )
{
    var _x = x + a_rand() % COLLECT_WIDTH - (COLLECT_WIDTH/2);
    var _y = y + a_rand() % COLLECT_HEIGHT - (COLLECT_HEIGHT/2);
    particles[i] = instance_create_layer(_x,_y, layer, obj_particle);
}

text_size = 25;
font_size = 45;
padding_top = 20;
padding_side = 10;

animation_step = 0;
ANIMATION_SPEED = 0.08;
counttime = true;
timer = 0;
global.IsHighscore = false;
died = false;

if (global.GAME_MODE == 1)
{
	trialtimer = 30 * game_get_speed(gamespeed_fps);
	trialdied = false;
	trialcount = true;
}