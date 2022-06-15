
if (state == READY)
{
	// on collision with a player obj:
	global.player_prev_room = room;
	global.player_x_before_battle = x;
	global.player_y_before_battle = y;
	global.curr_active_battle_spawn = id;
	
	global_spawner_units = units;
	
	with(objBattleSpawner)
	{
		visible = false;
	}
	
	global.warp_destination = battleroom;
	room_goto(battleroom);
}
