/// @description Capture gamepads
var pad = async_load[? "pad_index"];
var type = async_load[? "event_type"];

switch (type)
{
	case "gamepad discovered":
	{
		show_debug_message("Gotcha!");
		if (os_type != os_switch)
		{
			gp_count++;
			gp_arr[gp_count] = pad;
			gp_id = gp_arr[gp_count];
		}
		else
		{
			// Lets see if we already have one - as Joy-Con Duals can come in as *two* connect events
			var instCount = instance_number(SwitchPad);
			var controller = undefined;
			for (var i = 0; i < instCount; ++i) {
				var iController = instance_find(SwitchPad, i);
				if (iController.mPadId == pad) {
					controller = iController;
					break;
				}
			}

			var deviceType = gamepad_get_description(pad);
	
			if (undefined != controller) { // we already have a controller, check if it's a Joy-Con Dual and we've just connected half
				if ("Joy-Con" == deviceType && switch_controller_joycon_dual == controller.mType) {
					controller.mJoyCons[@ 0] = switch_controller_joycon_left_connected(pad);
					controller.mJoyCons[@ 1] = switch_controller_joycon_right_connected(pad);
					exit;
				}
			}
	
			var controller = instance_create_layer(x, y, layer, SwitchPad);
			controller.mPadId = pad;
			switch (deviceType) {
				case "Handheld": controller.mType = switch_controller_handheld; break;
				case "Joy-Con (L)": controller.mType = switch_controller_joycon_left; break;
				case "Joy-Con (R)":	controller.mType = switch_controller_joycon_right; break;
				case "Pro Controller": controller.mType = switch_controller_pro_controller; break;
				case "Joy-Con": {
					controller.mType = switch_controller_joycon_dual;
					controller.mJoyCons[@ 0] = switch_controller_joycon_left_connected(pad);
					controller.mJoyCons[@ 1] = switch_controller_joycon_right_connected(pad);
				};
				break;
			}
		}
		break;
	}
	case "gamepad lost":
	{
		if (os_type != os_switch)
		{
			gp_count--;
			gp_id = gp_arr[gp_count];
		}
		else
		{
			// Lets see if we already have one - as Joy-Con Duals can come in as *two* connect events
			var instCount = instance_number(SwitchPad);
			var controller = undefined;
			for (var i = 0; i < instCount; ++i) {
				var iController = instance_find(SwitchPad, i);
				if (iController.mPadId == pad) {
					controller = iController;
					break;
				}
			}

			var deviceType = gamepad_get_description(pad);
	
			if (undefined != controller) {
				if ("Joy-Con" == deviceType && switch_controller_joycon_dual == controller.mType) {
					controller.mJoyCons[@ 0] = switch_controller_joycon_left_connected(pad);
					controller.mJoyCons[@ 1] = switch_controller_joycon_right_connected(pad);
					if (true == controller.mJoyCons[0] || true == controller.mJoyCons[1]) // only half disconnected
						exit;
				}
				show_debug_message("Destroying controller: " + deviceType + " in slot " + string(pad));
				controller.mState = eState.Cleanup;
			}	
		}
		break;
	}
	default: break;
}