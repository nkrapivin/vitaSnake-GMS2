/// @description draw_set_color_manager(kind,bgid)
/// @param kind
/// @param bgid

//kind:
//0-font
//1-??

var _kind = argument0;
var _bgid = argument1;

if (_kind == 0)
{
    switch (_bgid)
    {
        default: break;
        case 0: return make_colour_rgb(0, 0, 0); //desert
        case 1: return make_colour_rgb(255, 255, 0); //classic
        case 2: return make_colour_rgb(40, 45, 34); //nokia
        case 3: return make_colour_rgb(0, 255, 0); //rpphs
    }
}
