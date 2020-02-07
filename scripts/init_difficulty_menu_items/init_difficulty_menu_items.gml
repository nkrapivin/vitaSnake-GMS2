/// @description init_difficulty_menu_wrappers()

itemd = array_create(MENU_ITEMS_DIFFICULTY);
for (var i = 0; i < MENU_ITEMS_DIFFICULTY; i++) itemd[i] = init_dummy_obj();

// Initialize menu items
itemd[0].name = "Classic";
itemd[0].x = 310;
itemd[0].y = 207;

itemd[1].name = "Hardcore";
itemd[1].x = 310;
itemd[1].y = 310;

cursord = 0;
