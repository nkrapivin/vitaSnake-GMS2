/// @desc time_format(time)
/// @arg time
var _str = string_format(argument0,2,2);
if (argument0 < 10)
{
	_str = string_delete(_str,1,1);
	_str = string_insert("0",_str,1);
}
return _str;