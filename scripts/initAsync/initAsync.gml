/// @description initAsync()

show_debug_message("loading save.ini...");
global.Buff = buffer_create(1, buffer_grow, 1);
global.BuffID = buffer_load_async(global.Buff, "save.ini", 0, -1);
global.FileAccess = true;
global.FileOp = 1;
