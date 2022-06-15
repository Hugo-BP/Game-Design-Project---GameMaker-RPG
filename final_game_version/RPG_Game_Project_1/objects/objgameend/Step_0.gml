
if (state == READY)
{
	turn_timer++;
	if (turn_timer >= 100)
	{
		state = REMOVE;
	}

}


if (state == REMOVE)
{
	objPlayer.is_busy = true;
	objPlayer.movement_disabled = true;
	global.gameover_menu_state = true;

}




