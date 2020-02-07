
if (paused) exit;

if (global.GAME_MODE == 4)
{
	if (mouse_check_button(mb_left))
	{
		if (isDragged)
		{
			snakeParts[0].x = mouse_x;
			snakeParts[0].y = mouse_y;
			snakeParts[0].r = snakeParts[1].r;
		}
		else if (touchingHead())
		{
			isDragged = true;
			snakeParts[0].x = mouse_x;
			snakeParts[0].y = mouse_y;
			snakeParts[0].r = snakeParts[1].r;
		}
		else isDragged = false;
	}
	else isDragged = false;
}

if (global.CONTROL_STYLE == 0 && global.GAME_MODE != 4)
{
	var _analogInput = 0;
	if (!scr_is_between(Gamepad.AxisLH,-ANALOG_DEADZONE,ANALOG_DEADZONE))
		_analogInput = Gamepad.AxisLH;
			
    var _keyL = keyboard_check(ord("A")) || keyboard_check(vk_left);
    var _keyR = keyboard_check(ord("D")) || keyboard_check(vk_right);
    if (!_keyL) _keyL = gamepad_button_check(Gamepad.gp_id, gp_padl);
	if (!_keyR) _keyR = gamepad_button_check(Gamepad.gp_id, gp_padr);
		
    if (_keyL && !_analogInput) snakeParts[0].r -= PLAYER_SET_ROTATION_SPEED * 1 * speed_mod;
    if (_keyR && !_analogInput) snakeParts[0].r += PLAYER_SET_ROTATION_SPEED * 1 * speed_mod;
	if (_analogInput != 0) snakeParts[0].r += (_analogInput * PLAYER_SET_ROTATION_SPEED * 1 * speed_mod);
}
else if (global.CONTROL_STYLE == 1 && global.GAME_MODE != 4)
{
	var dpadAngle = -1;
		
	var _keyL = keyboard_check(ord("A")) || keyboard_check(vk_left);
	var _keyR = keyboard_check(ord("D")) || keyboard_check(vk_right);
	var _keyU = keyboard_check(ord("W")) || keyboard_check(vk_up);
	var _keyD = keyboard_check(ord("S")) || keyboard_check(vk_down);
		
	if (!_keyL) _keyL = gamepad_button_check(Gamepad.gp_id, gp_padl);
	if (!_keyR) _keyR = gamepad_button_check(Gamepad.gp_id, gp_padr);
	if (!_keyU) _keyU = gamepad_button_check(Gamepad.gp_id, gp_padu);
	if (!_keyD) _keyD = gamepad_button_check(Gamepad.gp_id, gp_padd);
		
	if (_keyL && _keyU)
		dpadAngle = ( 7 * pi ) / 4;
	else if (_keyL && _keyD)
		dpadAngle = ( 5 * pi ) / 4;
	else if (_keyR && _keyU)
		dpadAngle = pi / 4;
	else if (_keyR && _keyD)
		dpadAngle = ( 3 * pi ) / 4;
			
	else if (_keyL) dpadAngle = 3 * pi / 2;
	else if (_keyR) dpadAngle = pi / 2;
	else if (_keyU) dpadAngle = 0;
	else if (_keyD) dpadAngle = pi;
		
	var _analogInput = -1;
	if (!scr_is_between(Gamepad.AxisLH,-ANALOG_DEADZONE,ANALOG_DEADZONE) || !scr_is_between(Gamepad.AxisLV,-ANALOG_DEADZONE,ANALOG_DEADZONE))
	{
		_analogInput = arctan2(Gamepad.AxisLV,Gamepad.AxisLH) + (pi / 2);
		if ( _analogInput < 0 ) _analogInput += pi * 2;
	}
			
	if (_analogInput != -1 && dpadAngle == -1)
	{
		if ( snakeParts[0].r < pi )
		{
			if ( _analogInput > snakeParts[0].r && _analogInput < (snakeParts[0].r + pi) )
				snakeParts[0].r += PLAYER_SET_ROTATION_SPEED * 1 * speed_mod;
			else
				snakeParts[0].r -= PLAYER_SET_ROTATION_SPEED * 1 * speed_mod;
		}
		else if ( snakeParts[0].r > pi )
		{
			if( _analogInput < (snakeParts[0].r - pi) )
				_analogInput += 2 * pi;
					
			if( _analogInput > snakeParts[0].r && _analogInput < (snakeParts[0].r + pi) )
				snakeParts[0].r += PLAYER_SET_ROTATION_SPEED * 1 * speed_mod;
			else
				snakeParts[0].r -= PLAYER_SET_ROTATION_SPEED * 1 * speed_mod;
		}
	}
	else if (_analogInput == -1 && dpadAngle != -1)
	{
		if( snakeParts[0].r < pi )
		{
			if( dpadAngle > snakeParts[0].r && dpadAngle < (snakeParts[0].r + pi) )
				snakeParts[0].r += PLAYER_SET_ROTATION_SPEED * 1 * speed_mod;
			else
				snakeParts[0].r -= PLAYER_SET_ROTATION_SPEED * 1 * speed_mod;
		}
		else if( snakeParts[0].r > pi )
		{
			if( dpadAngle < (snakeParts[0].r - pi) )
				dpadAngle += 2 * pi;
					
			if( dpadAngle > snakeParts[0].r && dpadAngle < (snakeParts[0].r + pi) )
				snakeParts[0].r += PLAYER_SET_ROTATION_SPEED * 1 * speed_mod;
			else
				snakeParts[0].r -= PLAYER_SET_ROTATION_SPEED * 1 * speed_mod;
		}
	}
}
else if (global.GAME_MODE == 4 && isDragged)
{
	touchX = mouse_x;
	touchY = mouse_y;
		
	touchAngle = arctan2( touchY-snakeParts[0].y, touchX-snakeParts[0].x ) + (pi / 2);
	window_set_caption(touchAngle);
	if( touchAngle < 0 ) touchAngle += pi * 2;
		
	if ( snakeParts[0].r < pi )
	{
		if( touchAngle > snakeParts[0].r && touchAngle < (snakeParts[0].r + pi) )
			snakeParts[0].r += PLAYER_SET_ROTATION_SPEED * 1 * speed_mod;
		else
			snakeParts[0].r -= PLAYER_SET_ROTATION_SPEED * 1 * speed_mod;
	}
	else if ( snakeParts[0].r > pi )
	{
		if( touchAngle < (snakeParts[0].r - pi) ) touchAngle += 2 * pi;
			
		if( touchAngle > snakeParts[0].r && touchAngle < (snakeParts[0].r + pi) )
			snakeParts[0].r += PLAYER_SET_ROTATION_SPEED * 1 * speed_mod;
		else
			snakeParts[0].r -= PLAYER_SET_ROTATION_SPEED * 1 * speed_mod;
	}
}


if (keyboard_check(vk_shift) || keyboard_check(vk_space)) //thanks to GM:S it's both Left and Right shift.
{
	spd = 1.5 * -PLAYER_SET_SPEED * 1 * speed_mod;
}
else
{
	spd = -PLAYER_SET_SPEED * 1 * speed_mod;
}


// Normalize player rotation
if( snakeParts[0].r < 0 )
    snakeParts[0].r += ( 2 * pi );
else if( snakeParts[0].r > ( 2 * pi ) )
    snakeParts[0].r = snakeParts[0].r - ( 2 * pi );

// Calcule player position
if (global.GAME_MODE != 4)
{
    snakeParts[0].x -= sin( snakeParts[0].r ) * spd;
    snakeParts[0].y += cos( snakeParts[0].r ) * spd;
}

// Trap the player inside the screen
if( snakeParts[0].x < PLAYER_HEIGHT * 0.45 )
    snakeParts[0].x = PLAYER_HEIGHT * 0.45;
else if( snakeParts[0].x > SCREEN_WIDTH - PLAYER_HEIGHT * 0.45 )
    snakeParts[0].x = SCREEN_WIDTH - PLAYER_HEIGHT * 0.45;
if( snakeParts[0].y < PLAYER_HEIGHT * 0.45 )
    snakeParts[0].y = PLAYER_HEIGHT * 0.45;
else if( snakeParts[0].y > SCREEN_HEIGHT - PLAYER_HEIGHT * 0.45 )
    snakeParts[0].y = SCREEN_HEIGHT - PLAYER_HEIGHT * 0.45;

// Don't bother calculating positions of the end of a very long snake
for (var i = 1; i < array_length_1d(snakeParts) && i < 1000; ++i)
{
    if (snakeParts[i].r < 0)
        snakeParts[i].r += -radtodeg( 2 * pi );
    else if (snakeParts[i].r > ( 2 * pi ))
        snakeParts[i].r -= -radtodeg( 2 * pi );
        
    
    // Calculate distance to previous part
    var distance = sqrt( power( ( snakeParts[i-1].x - snakeParts[i].x ), 2) + power( ( snakeParts[i-1].y - snakeParts[i].y ), 2 ) );
    
    // Rotate to look at previous part
    snakeParts[i].r = (arctan2( snakeParts[i-1].y - snakeParts[i].y, snakeParts[i-1].x - snakeParts[i].x ) + ( pi / 2 ));
    
    
    // If the distance is too far, move to the correct distance
    if ( distance > FOLLOW_DISTANCE )
    {
        snakeParts[i].x += sin( snakeParts[i].r ) * ( distance - FOLLOW_DISTANCE );
        snakeParts[i].y -= cos( snakeParts[i].r ) * ( distance - FOLLOW_DISTANCE );
    }
    
    // Trap the part inside the screen
    if( snakeParts[i].x < 0 )
        snakeParts[i].x = 0;
    else if( snakeParts[i].x > SCREEN_WIDTH )
        snakeParts[i].x = SCREEN_WIDTH;
    if( snakeParts[i].y < 0 )
        snakeParts[i].y = 0;
    else if( snakeParts[i].y > SCREEN_HEIGHT )
        snakeParts[i].y = SCREEN_HEIGHT;
}

x = snakeParts[0].x;
y = snakeParts[0].y;

shouldDie = false;
if (global.GAME_DIFFICULTY == 1) //hardcore, die from touching a wall.
{
	if( snakeParts[0].x <= PLAYER_HEIGHT * 0.45 )
		shouldDie = true;
	else if( snakeParts[0].x >= SCREEN_WIDTH - PLAYER_HEIGHT * 0.45 )
		shouldDie = true;
	if( snakeParts[0].y <= PLAYER_HEIGHT * 0.45 )
		shouldDie = true;
	else if( snakeParts[0].y >= SCREEN_HEIGHT - PLAYER_HEIGHT * 0.45 )
		shouldDie = true;
}

tailCollide = false;
if( array_length_1d(snakeParts) > START_SNAKE_LENGTH )
{
	// Don't bother calculating collisions of the end of a very long snake
	for( var i = START_SNAKE_LENGTH+1; i < array_length_1d(snakeParts) && i < 1000; ++i )
	{
		// Check collisions only if parts don't overlap
		if( snakeParts[ i ].x != snakeParts[ i-1 ].x || snakeParts[ i ].y != snakeParts[ i-1 ].y )
		{
			var distance = sqrt( power( ( snakeParts[i].x - snakeParts[0].x ), 2) + power( ( snakeParts[i].y - snakeParts[0].y ), 2 ) );
			if( distance < COLLISION_DISTANCE )
				tailCollide = true;
		}
	}
}