if (state == INIT)
{
	if (nr_lines > MAX_NR_OPTIONS)
	{
		final_line = 4;
	}
	else
	{
		final_line = nr_lines;
	}
	state = STAND_BY;
}

if (keyboard_check_released(QUIT_KEY))
{
	objPlayer.is_busy = false;
	objPlayer.movement_disabled = false;
	
	instance_destroy(objGenericMenu);
}

if (index < 0) 
{
	instance_destroy();
	
	with (objGenericMenu)
	{
		if state == STAND_BY
			index--;
	
	}
}

if (state == STAND_BY)
{
	if (index == 0) 
	{
		state = READY
	}
}
	
if (state == READY)
{
	if (output_type = M_OPTIONS)
	{
		selected += keyboard_check_released(DOWN_KEY) - keyboard_check_released(UP_KEY);

		if (selected > nr_lines-1)
		{
			selected = 0; 
		}
		if (selected < 0)
		{
			selected = nr_lines-1; 
		}

		if ( (keyboard_check_released(CONTINUE_KEY) and options[selected][1] == -1 and selected == nr_lines-1 ))
		{
			if (final_interaction)
			{
				objPlayer.is_busy = false;
				objPlayer.movement_disabled = false;
			}
			index--;	
		}
		if (keyboard_check_released(CONTINUE_KEY))
		{
			// run the script of the selected option
			if (array_length(options[selected]) == 3)
			{
				var do_if_selected = options[selected][1];
				var target_of_interaction = options[selected][2];
		
				if (do_if_selected != -1)
				{
					do_if_selected(target_of_interaction);
				}
				index--;	
			}
		}
	}

	if (output_type = M_TEXT)
	{	
		if (keyboard_check_released(CONTINUE_KEY))
		{
			// show next line
			if (final_line < nr_lines)
			{
				final_line++;
				first_line++;
			}
			// theres no more text
			else
			{
				if (final_interaction)
				{
					objPlayer.is_busy = false;
					objPlayer.movement_disabled = false;
				}
				index--;	
			}
		}
	}
}
	


	
	
	
	
	
