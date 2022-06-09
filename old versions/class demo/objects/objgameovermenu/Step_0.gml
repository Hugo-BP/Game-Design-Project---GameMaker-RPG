
if (global.gameover_menu_state)	
{

	selected_pm += keyboard_check_released(DOWN_KEY) - keyboard_check_released(UP_KEY);
		
	if (selected_pm > nr_options_pm-1)
	{
		selected_pm = 1; 
	}
	if (selected_pm < 1)
	{
		selected_pm = nr_options_pm-1; 
	}
	// select option, if option is exit then close game.
	if (keyboard_check_pressed(CONTINUE_KEY))
	{
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
