/// @description init_stats_menu_items()

item = array_create(MENU_ITEMS_STATS);
for (var i = 0; i < MENU_ITEMS_STATS; i++) item[i] = init_dummy_obj();

margin_x = ( SCREEN_WIDTH - BUTTON_WIDTH ) / 2;
margin_y = 280;
padding = 30;

// Initialize menu items
item[0].name = "How to play";
item[0].x = margin_x;
item[0].y = margin_y;

item[1].name = "Credits";
item[1].x = margin_x;
item[1].y = item[0].y + BUTTON_HEIGHT + padding;

cursor = 0;
