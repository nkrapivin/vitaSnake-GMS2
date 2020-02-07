activated = false;
if (!instance_exists(obj_stats))
    instance_create_layer(0,0,global._OLayer,obj_stats);
else
    alarm[2] = 1;

