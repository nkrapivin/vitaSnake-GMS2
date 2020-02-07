/// @description Spawn options menu.
activated = false;
if (!instance_exists(obj_menu_options))
    instance_create_layer(0,0,global._OLayer,obj_menu_options);
else alarm[0] = 1;

