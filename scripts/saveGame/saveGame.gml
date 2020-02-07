/// @description saveGame()

if (global.FileAccess) show_error("ERROR: File operation is in progress already!", false);

ini_open_from_string("");

// ----- Settings ----- //
ini_write_real("Settings", "BGID", global.BGID);
ini_write_real("Settings", "CONTROL_STYLE", global.CONTROL_STYLE);
ini_write_real("Settings", "PLAYER_TEXTURES", global.PLAYER_TEXTURES);
ini_write_real("Settings", "ENABLE_ANIMATION", global.ENABLE_ANIMATION);
ini_write_real("Settings", "ENABLE_PARTICLES", global.ENABLE_PARTICLES);
ini_write_real("Settings", "APPLE_TEXTURE", global.APPLE_TEXTURE);
ini_write_real("Settings", "ENABLE_FULLSCREEN", global.ENABLE_FULLSCREEN);

// ----- Stats ----- //
ini_write_real("Stats", "stats_applesEaten", global.stats_applesEaten);
ini_write_real("Stats", "stats_timePlayed", global.stats_timePlayed);
ini_write_real("Stats", "stats_totalDeaths", global.stats_totalDeaths);

// ----- Highscores ----- //

//Casual
ini_write_real("Highscores", "gCdC", global.stats_Highscores[0,0]);
ini_write_real("Highscores", "gCdH", global.stats_Highscores[0,1]);

//Time Trial
ini_write_real("Highscores", "gTdC", global.stats_Highscores[1,0]);
ini_write_real("Highscores", "gTdH", global.stats_Highscores[1,1]);

//Hyper
ini_write_real("Highscores", "gHdC", global.stats_Highscores[2,0]);
ini_write_real("Highscores", "gHdH", global.stats_Highscores[2,1]);

//Fibonacci
ini_write_real("Highscores", "gFdC", global.stats_Highscores[3,0]);
ini_write_real("Highscores", "gFdH", global.stats_Highscores[3,1]);

//Lazy
ini_write_real("Highscores", "gLdC", global.stats_Highscores[4,0]);
ini_write_real("Highscores", "gLdH", global.stats_Highscores[4,1]);

var _ini = ini_close();

global.Buff = buffer_create(string_byte_length(_ini) + 1, buffer_fixed, 1);
buffer_write(global.Buff, buffer_string, _ini);
global.BuffID = buffer_save_async(global.Buff, "save.ini", 0, buffer_get_size(global.Buff));
global.FileAccess = true;
global.FileOp = 0; //0 - saving, 1 - loading
