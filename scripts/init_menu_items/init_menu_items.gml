/// @description init_menu_items()

item = array_create(MENU_ITEMS_MAIN);

for (var i = 0; i < MENU_ITEMS_MAIN; i++)
    item[i] = init_dummy_obj();

item[0].name = "Start Game";
item[0].x = 310;
item[0].y = 170;

item[1].name = "Extras";
item[1].x = 310;
item[1].y = 260;

item[2].name = "Options";
item[2].x = 310;
item[2].y = 350;

item[3].name = "Exit";
item[3].x = 310;
item[3].y = 440;

cursor = 0;
