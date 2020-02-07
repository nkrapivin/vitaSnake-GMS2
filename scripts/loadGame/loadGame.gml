/// @description loadGame()

// ----- Settings ----- //
global.BGID = ini_read_real("Settings", "BGID", 0);
global.CONTROL_STYLE = ini_read_real("Settings", "CONTROL_STYLE", 0);
global.PLAYER_TEXTURES = ini_read_real("Settings", "PLAYER_TEXTURES", 0);
global.ENABLE_ANIMATION = ini_read_real("Settings", "ENABLE_PARTICLES", true);
global.ENABLE_PARTICLES = ini_read_real("Settings", "ENABLE_PARTICLES", true);
global.APPLE_TEXTURE = ini_read_real("Settings", "APPLE_TEXTURE", 0);
global.ENABLE_FULLSCREEN = ini_read_real("Settings", "ENABLE_FULLSCREEN", false);

// ----- Stats ----- //
global.stats_applesEaten = ini_read_real("Stats", "stats_applesEaten", 0);
global.stats_timePlayed = ini_read_real("Stats", "stats_timePlayed", 0);
global.stats_totalDeaths = ini_read_real("Stats", "stats_totalDeaths", 0);

// ----- Highscores ----- //

//Casual
global.stats_Highscores = 0;
global.stats_Highscores[0,0] = ini_read_real("Highscores", "gCdC", 0); // game Casual difficulty Casual
global.stats_Highscores[0,1] = ini_read_real("Highscores", "gCdH", 0); // game Casual difficulty Hardcore

//Time Trial
global.stats_Highscores[1,0] = ini_read_real("Highscores", "gTdC", 0);
global.stats_Highscores[1,1] = ini_read_real("Highscores", "gTdH", 0);

//Hyper
global.stats_Highscores[2,0] = ini_read_real("Highscores", "gHdC", 0);
global.stats_Highscores[2,1] = ini_read_real("Highscores", "gHdH", 0);

//Fibonacci
global.stats_Highscores[3,0] = ini_read_real("Highscores", "gFdC", 0);
global.stats_Highscores[3,1] = ini_read_real("Highscores", "gFdH", 0);

//Lazy
global.stats_Highscores[4,0] = ini_read_real("Highscores", "gLdC", 0);
global.stats_Highscores[4,1] = ini_read_real("Highscores", "gLdH", 0);

obj_menu.activated = true;
scr_options_fullscreen();
