/// @description checkOpenDistance()

var distance = sqrt( power( ( obj_player.x - x ), 2) + power( ( obj_player.y - y ), 2 ) );

if (distance < OPEN_DISTANCE)
    return true;
else
    return false;
