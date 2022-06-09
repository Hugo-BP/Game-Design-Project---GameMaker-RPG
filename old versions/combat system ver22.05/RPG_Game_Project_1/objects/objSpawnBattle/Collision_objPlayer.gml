
if (is_active)
{
	global.player_prev_room = room;
	global.player_x_before_battle = x;
	global.player_y_before_battle = y-sprite_height-2;
	global.curr_active_battle_spawn = other.id;

	room_goto(BattleRoom);
}
