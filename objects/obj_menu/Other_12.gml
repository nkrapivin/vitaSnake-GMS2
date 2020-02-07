activated = false;
if (!instance_exists(obj_menu_start_game))
    instance_create_layer(0,0,global._OLayer,obj_menu_start_game);
else
    alarm[3] = 1;

