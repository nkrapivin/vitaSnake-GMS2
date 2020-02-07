/// @description init_options_menu_items()

option = array_create(MENU_ITEMS_OPTIONS);
particles = array_create(TOTAL_PARTICLES);
for (var i = 0; i < TOTAL_PARTICLES; i++) particles[i] = noone;
for (var i = 0; i < MENU_ITEMS_OPTIONS; i++)
{
    option[i] = init_dummy_obj();
}

// Initialize the "control type" selectable
option[ 0 ]._id= 0;
option[ 0 ].name= "Control type:";
option[ 0 ].name_x= 20.0;
option[ 0 ].name_y= 140.0;
option[ 0 ].slct_x= ITEM_X;
option[ 0 ].slct_y= option[ 0 ].name_y;
option[ 0 ].desc_x= DESC_X;
option[ 0 ].desc_y= option[ 0 ].name_y;
option[ 0 ].selected = 0;
option[ 0 ].nr_selectables = 2;

// Initialize the "player style" selectable
option[ 1 ]._id= 1;
option[ 1 ].name= "Player style:";
option[ 1 ].name_x= option[ 0 ].name_x;
option[ 1 ].name_y= option[ 0 ].name_y + 70;
option[ 1 ].slct_x= ITEM_X;
option[ 1 ].slct_y= option[ 1 ].name_y;
option[ 1 ].desc_x= DESC_X;
option[ 1 ].desc_y= option[ 1 ].name_y;
option[ 1 ].selected = 0;
option[ 1 ].nr_selectables = 4;

// Initialize the "background style" selectable
option[ 2 ]._id = 2;
option[ 2 ].name = "BG style:";
option[ 2 ].name_x = option[ 0 ].name_x;
option[ 2 ].name_y = option[ 1 ].name_y + 70;
option[ 2 ].slct_x = ITEM_X;
option[ 2 ].slct_y = option[ 2 ].name_y;
option[ 2 ].desc_x = DESC_X;
option[ 2 ].desc_y = option[ 2 ].name_y;
option[ 2 ].selected = 0;
option[ 2 ].nr_selectables = 4;

// Initialize the "apple style" selectable
option[ 3 ]._id = 3;
option[ 3 ].name = "Apple style:";
option[ 3 ].name_x = option[ 0 ].name_x;
option[ 3 ].name_y = option[ 2 ].name_y + 70;
option[ 3 ].slct_x = ITEM_X;
option[ 3 ].slct_y = option[ 3 ].name_y;
option[ 3 ].desc_x = DESC_X;
option[ 3 ].desc_y = option[ 3 ].name_y;
option[ 3 ].selected = 0;
option[ 3 ].nr_selectables = 6;

// Initialize the "Collectable effects" selectable
option[ 4 ]._id = 4;
option[ 4 ].name = "Apple effects:";
option[ 4 ].name_x = option[ 0 ].name_x;
option[ 4 ].name_y = option[ 3 ].name_y + 70;
option[ 4 ].slct_x = ITEM_X;
option[ 4 ].slct_y = option[ 4 ].name_y;
option[ 4 ].desc_x = DESC_X;
option[ 4 ].desc_y = option[ 4 ].name_y;
option[ 4 ].selected = 0;
option[ 4 ].nr_selectables = 2;

// Initialize the "Fullscreen" selectable
option[ 5 ]._id = 5;
option[ 5 ].name = "Fullscreen:";
option[ 5 ].name_x = option[ 0 ].name_x;
option[ 5 ].name_y = option[ 4 ].name_y + 70;
option[ 5 ].slct_x = ITEM_X;
option[ 5 ].slct_y = option[ 5 ].name_y;
option[ 5 ].desc_x = DESC_X;
option[ 5 ].desc_y = option[ 5 ].name_y;
option[ 5 ].selected = 1;
option[ 5 ].nr_selectables = 2;


option[ 0 ].selected = global.CONTROL_STYLE;
option[ 1 ].selected = global.PLAYER_TEXTURES;
option[ 2 ].selected = global.BGID;
option[ 3 ].selected = global.APPLE_TEXTURE;
option[ 4 ].selected = (!(global.ENABLE_PARTICLES && global.ENABLE_ANIMATION));
option[ 5 ].selected = !global.ENABLE_FULLSCREEN;

apple_x = DESC_X;
apple_y = option[ 3 ].slct_y - 28;
apple_xmid = 0;
apple_ymid = 0;
apple_w = 30;
apple_h = 30;
apple_step = 0;
apple_r = 0;

snakeTexturesN[0] = "Default";
snakeTexturesN[1] = "Classic";
snakeTexturesN[2] = "RPPHS";
snakeTexturesN[3] = "Nokia";

bgTexturesN[0] = "Desert";
bgTexturesN[1] = "Classic";
bgTexturesN[2] = "Nokia";
bgTexturesN[3] = "RPPHS";

collectableTexturesN[0] = "Default";
collectableTexturesN[1] = "Classic";
collectableTexturesN[2] = "RPPHS";
collectableTexturesN[3] = "Nokia";
collectableTexturesN[4] = "Battery";
collectableTexturesN[5] = "Mushroom";

cursor = 0;
