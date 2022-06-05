if (state == INIT)
{
	// TEXT only
	if (nr_lines > MAX_NR_OPTIONS-1)
	{
		final_line = 4;
	}
	else
	{
		final_line = nr_lines;
	}
	state = STAND_BY;
}

// delete all menu objects
if (not global.player_menu_state)
{

// delete all menu objects
if (keyboard_check_released(QUIT_KEY))
{
	objPlayer.is_busy = false;
	objPlayer.movement_disabled = false;
	
	with (objGenericMenu)
	{
		instance_destroy(objGenericMenu);
	}
}

// Get rid of current menu and decrement other menus indexes
if (index < 0) 
{
	instance_destroy();
	
	with (objGenericMenu)
	{
		if state == STAND_BY
			index--;
	
	}
}

// menu at index 0 becomes the active menu
if (state == STAND_BY)
{
	if (index == 0) 
	{
		state = READY
	}
}
	
// Menu logic
if (state == READY)
{
	// If menu is built for options
	if (output_type = M_OPTIONS)
	{
		// iterate options
		selected += keyboard_check_released(DOWN_KEY) - keyboard_check_released(UP_KEY);

		if (selected > nr_lines-1)
		{
			selected = 0; 
		}
		if (selected < 0)
		{
			selected = nr_lines-1; 
		}
		// select option, if option is exit then delete menu. final option is always an exit/decline option
		if ( (keyboard_check_released(CONTINUE_KEY) and options[selected][1] == -1 and selected == nr_lines-1 ))
		{
			// if this ends interaction then player should have movement unlocked
			if (final_interaction)
			{
				objPlayer.is_busy = false;
				objPlayer.movement_disabled = false;
			}
			// decrement index
			index--;	
		}
		
		// select option
		if (keyboard_check_released(CONTINUE_KEY))
		{
			// run the script of the selected option, this would be [option_text, option_script]
			// can use is_method() to check if its a script or not
			if (array_length(options[selected]) == 3)
			{
				var do_if_selected = options[selected][1];	// script
				var target_of_interaction = options[selected][2]; // target of script
		
				if (do_if_selected != -1 and is_method(do_if_selected) == 0)
				{
					do_if_selected(target_of_interaction);
				}
				else
				{
					show_debug_message("didnt send a script to generic menu option");
				}
				// decrement index
				index--;	
			}
		}
	}

	// If menu is built for walls of text (dialog, reading, examie, etc)
	if (output_type = M_TEXT)
	{	
		// max of 4 lines of text
		if (keyboard_check_released(CONTINUE_KEY))
		{
			// show next line, hide first line
			if (final_line < nr_lines)
			{
				final_line++;
				first_line++;
			}
			
			// theres no more text
			else
			{
				// if this ends interaction then player should have movement unlocked
				if (final_interaction)
				{
					objPlayer.is_busy = false;
					objPlayer.movement_disabled = false;
				}
				// decrement index
				index--;	
			}
		}
	}
}
	
}

	
	
	
	
	
