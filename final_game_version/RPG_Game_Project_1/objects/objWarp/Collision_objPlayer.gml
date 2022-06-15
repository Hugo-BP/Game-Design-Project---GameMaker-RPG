
if (keyboard_check_pressed(INTERACTION_KEY)){
	if(global.finishedRoom1 or global.finishedRoom0){
		//playerx =  other.x;
		//playery =  other.y;
	global.player_warp_to_x = warp_x;
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
	}else{
	objPlayer.is_busy = true;
    objPlayer.movement_disabled = true;
	text_arr0 ="im busy in this map, still have a quest to do!/";
	text_arr0 = ScriptTextParser(text_arr0);	
	ScriptGenericMenu(M_TEXT, text_arr0,"RED",true, 0);
	}	
}




	
