
function ScriptWarpCollision(){
	if (collision_point(x, y, objWarp, false, false))
	{
		if (global.player_can_warp)
		{
			//if (keyboard_check_pressed(vk_space)) // TODO text box asking to go to other room or stay
		//	{
				warp = collision_point(x, y, objWarp, false, false);
				global.player_warp_to_x = warp.warp_x;
				global.player_warp_to_y = warp.warp_y;
				global.player_can_warp = false;
			
				room_goto(warp.warp_room);
			//}
		}	
	}
	else
	{
		movement_disabled = false;
		is_busy = false;
		global.player_can_warp = true;
	}
}