

if (keyboard_check_pressed(INTERACTION_KEY))
{
	global.player_warp_to_x = other.x;
	global.player_warp_to_y = warp_y;
	global.player_just_warped = true;
	if (warp_room != noone)
	{
		global.warp_destination = warp_room;
		room_goto(warp_room);	
	}
	else
	{
		other.x = global.player_warp_to_x;
		other.y = global.player_warp_to_y;
	}
}
