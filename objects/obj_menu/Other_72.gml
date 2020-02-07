var i_d = async_load[? "id"];
var stat = async_load[? "status"];
if (global.FileAccess && (i_d == global.BuffID))
{
    global.FileAccess = false;
    
    show_debug_message("status " + string(stat));
    
    switch (global.FileOp)
    {
        case 0: //saving
        {
            buffer_delete(global.Buff);
            global.Buff = NULL; // NULL == -1 in GM:S
            if (os_type == os_switch) switch_save_data_commit();
            
            show_debug_message("Saved!");
            break;
        }
        case 1: //loading
        {
            var _ini = buffer_read(global.Buff, buffer_string);
            ini_open_from_string(_ini);
            loadGame();
            ini_close();
            
            buffer_delete(global.Buff);
            global.Buff = NULL;
            show_debug_message("Loaded!");
            break;
        }
        default: break;
    }
}
else
{
    show_debug_message("error!");
    show_debug_message("error status " + string(stat));
}

