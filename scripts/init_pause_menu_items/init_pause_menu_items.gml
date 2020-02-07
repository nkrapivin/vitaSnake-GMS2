/// @description init_pause_menu_items()

item = array_create(MENU_ITEMS_DIFFICULTY);
for (var i = 0; i < MENU_ITEMS_DIFFICULTY; i++) item[i] = init_dummy_obj();

// Initialize menu items
item[0].name = "Resume game";
item[0].x = 310;
item[0].y = 310;

item[1].name = "Main menu";
item[1].x = 310;
item[1].y = 411;

// Initialize cursor
cursor = 0;