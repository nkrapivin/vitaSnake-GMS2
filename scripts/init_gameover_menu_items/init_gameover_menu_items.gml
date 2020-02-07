/// @desc init_gameover_menu_items()

item = array_create(MENU_ITEMS_GAMEOVER);
for (var i = 0; i < MENU_ITEMS_GAMEOVER; i++) item[i] = init_dummy_obj();

// Initialize menu items
item[0].name = "Play Again";
item[0].x = 310 - 200;
item[0].y = 400;

item[1].name = "Main menu";
item[1].x = 310 + 200;
item[1].y = item[0].y;

// Initialize cursor
cursor = 0;