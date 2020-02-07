score = 0;
image_speed = 0;
image_index = 0;
paused = false;
PLAYER_WIDTH = 30;
PLAYER_HEIGHT = 40;
FOLLOW_DISTANCE = 28;
COLLISION_DISTANCE = 20;
ANALOG_DEADZONE = 0.2;
SPEED_UP_MODIFIER = 1.05;
PLAYER_SET_SPEED = 0;
PLAYER_SET_ROTATION_SPEED = 0;
START_SNAKE_LENGTH = 3;
ANALOG_DEADZONE = 0.6;

switch( global.GAME_DIFFICULTY )
{
    case 0:
    {
        PLAYER_SET_SPEED = 5;
        PLAYER_SET_ROTATION_SPEED = 0.07;
        break;
    }
    case 1:
    {
        PLAYER_SET_SPEED = 6;
        PLAYER_SET_ROTATION_SPEED = 0.08;
        break;
    }
    
    default: break;
}

spd = -PLAYER_SET_SPEED;

snakeParts = array_create(4);

snakeParts[0] = newPart(SCREEN_WIDTH / 6, SCREEN_HEIGHT / 2, pi / 2);
for( var i = 1; i < 4; ++i )
{
    snakeParts[i] = newPart(0, SCREEN_HEIGHT / 2, pi / 2);
}

isClose = false;
isDragged = false;
speed_mod = 1;
shouldDie = false;
tailCollide = false;

instance_create_layer(512, 512, layer, obj_apple);

