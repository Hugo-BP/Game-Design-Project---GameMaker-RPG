
if (keyboard_check_released(PLAYER_MENU_KEY) and not global.gameover)
{
	if (not global.player_menu_state)
	{
		global.player_menu_state = true;
		selected_pm = 0;
	}
}

if (global.player_menu_state)	
{
	selected_pm += keyboard_check_released(DOWN_KEY) - keyboard_check_released(UP_KEY);
		
	if (selected_pm > nr_options_pm-1)
	{
		selected_pm = 0; 
	}
	if (selected_pm < 0)
	{
		selected_pm = nr_options_pm-1; 
	}
	// select option, if option is exit then close game.
	if (keyboard_check_released(CONTINUE_KEY))
	{
		if (global.player_menu_text[selected_pm] == "CONTINUE")
		{
			global.player_menu_state = false;
			selected_pm = 0;
		}
		if (global.player_menu_text[selected_pm] == "LOAD GAME")
		{
			// TODO
		}
		if (global.player_menu_text[selected_pm] == "NEW GAME")
		{
			// TODO
		}
		if (global.player_menu_text[selected_pm] == "SETTINGS")
		{
			// TODO
		}
		if (global.player_menu_text[selected_pm] == "EXIT")
		{
			game_end();
		}
	}
}
