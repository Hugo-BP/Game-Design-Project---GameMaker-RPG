

// input_type - whether its a wall of text or options to choose from ( M_TEXT OR M_OPTIONS )
// menu_options - this is text, if its wall of text it needs to go through the textparser script first, options are in the [[op1, do1],[op2, do2]] format. if option does nothing then do = -1
// menu_description - standard string, this is the menu title
// is_final_interaction - whether the player should be able to move after said menu is closed. only the final menu should be true, options BOOL are always true if do !=-1
// menu_index - order in which the menus are closed ( player sees the menus}

// MENU OPTIONS 4 MAX
function ScriptGenericMenu(input_type, menu_options, menu_description = -1, is_final_interaction, menu_index)
{
	// get menu draw coordinates
	menu_x = view_wport[0] * 0.05;
	menu_y = view_hport[0] - (6*font_get_size(FontGenericMenu) + 2*INTERACTION_MENU_MARGIN);

	with (instance_create_depth(menu_x, menu_y, -999, objGenericMenu))
	{
		// init menu obj
		index = menu_index;
		options = menu_options;
		desc = menu_description;
		nr_lines = array_length(options);
		
		text_pointer = "> ";
		
		output_type = input_type;
		final_interaction = is_final_interaction;
		
		margin = INTERACTION_MENU_MARGIN;
		
		draw_set_font(FontGenericMenu);

		// get maximum dimensions
		width = view_wport[0]*0.9;
		height = font_get_size(FontGenericMenu) * 6;		
		total_width = width + margin*2;
		total_height = height + margin*2;
	}
}