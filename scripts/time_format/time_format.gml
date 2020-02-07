/// @desc time_format(time)
/// @arg time
var steps = argument0 * game_get_speed(gamespeed_fps);
var mins = 0;
var secs = 0;

//Get secs
while (steps > 60)
{
	secs++;
	steps -= 60;
}

//Get mins
while (secs > 60)
{
	mins++;
	secs -= 60;
}

if (mins < 10) mins = "0" + string(mins);
else mins = string(mins);
if (secs < 10) secs = "0" + string(secs);
else secs = string(secs);

//Return string
return mins + ":" + secs;