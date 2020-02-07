if (os_type == os_switch)
{
	switch_accounts_get_accounts();
	switch_accounts_select_account(true, false, false);
	
	switch_controller_set_supported_styles( switch_controller_handheld | switch_controller_pro_controller | switch_controller_joycon_dual | switch_controller_joycon_left | switch_controller_joycon_right );
	switch_controller_joycon_set_holdtype(switch_controller_joycon_holdtype_vertical);
	switch_controller_set_handheld_activation_mode(switch_controller_handheld_activation_dual);
	
	switch_controller_support_set_defaults();
	switch_controller_support_set_singleplayer_only(true);
	switch_controller_support_show(); //show the applet
}

global.__fontmap = ds_map_create();
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);

global._OLayer = layer_get_id("OptionsLayer");
global._PLayer = layer_get_id("PlayerLayer");
global._ZLayer = layer_get_id("PauseLayer");

global.IsMobile = ((os_type == os_android) || (os_type == os_ios) || (os_type == os_winphone));

audio_master_gain(0.6);

global.BGID = 0;
global.CONTROL_STYLE = 0;
global.PLAYER_TEXTURES = 0;
global.ENABLE_ANIMATION = true;
global.ENABLE_PARTICLES = true;
global.APPLE_TEXTURE = 0;
global.ENABLE_FULLSCREEN = false;
global.GAME_MODE = 0;
global.GAME_DIFFICULTY = 0;

global.stats_applesEaten = 0;
global.stats_timePlayed = 0;
global.stats_totalDeaths = 0;

global.Buff = NULL;
global.BuffID = NULL;
global.FileAccess = false;
global.FileOp = 0;
initAsync();

border_red = 0;
splashlines = 0;
var _f = file_text_open_read("splash.txt");
var _i = 0;
while (!file_text_eof(_f))
{
    splashlines[_i] = file_text_read_string(_f);
    file_text_readln(_f);
    _i++;
}
file_text_close(_f);
splashline = splashlines[abs(a_rand()) % array_length_1d(splashlines)];

init_menu_items();
logoPosX = 95;
logoSize = 60;
font_size = 23;
border_thickness = 4;
textSize = 42;

MAIN_FONT_COLOR = draw_set_color_manager(0,global.BGID);

activated = false;
in_position = false;

//show_message(splashline);

