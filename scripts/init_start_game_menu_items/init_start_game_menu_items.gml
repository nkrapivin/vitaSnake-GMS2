/// @description init_start_game_menu_items()

item = array_create(MENU_ITEMS_START);
for (var i = 0; i < MENU_ITEMS_START; i++) item[i] = init_dummy_obj();

// Initialize menu items
item[0].name = "Classic";
item[0].x = margin_x;
item[0].y = margin_y;

item[1].name = "Time Trial";
item[1].x = margin_x;
item[1].y = margin_y + BUTTON_HEIGHT + padding;

item[2].name = "Hyper Snake";
item[2].x = margin_x;
item[2].y = margin_y + 2*BUTTON_HEIGHT + 2*padding;

item[3].name = "Fibonacci";
item[3].x = margin_x;
item[3].y = margin_y + 3*BUTTON_HEIGHT + 3*padding;

item[4].name = "Lazy Snake";
item[4].x = margin_x;
item[4].y = SCREEN_HEIGHT - margin_y - BUTTON_HEIGHT;

// Initialize cursor
cursor = 0;
