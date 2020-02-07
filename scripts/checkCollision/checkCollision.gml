/// @description checkCollision()

var distance = sqrt( power( ( obj_player.x - x ), 2) + power( ( obj_player.y - y ), 2 ) );

if (distance < COLLISION_DISTANCE)
    return true;
else
    return false;
