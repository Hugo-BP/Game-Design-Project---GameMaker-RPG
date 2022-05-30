

// MENU OPTIONS 4 MAX
function ScriptGenericMenu(input_type, menu_options, menu_description = -1, _final_interaction, menu_index)
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
		final_interaction = _final_interaction;
		
		margin = INTERACTION_MENU_MARGIN;
		
		draw_set_font(FontGenericMenu);

		// get maximum dimensions
		width = view_wport[0]*0.9;
		height = font_get_size(FontGenericMenu) * 6;		
		total_width = width + margin*2;
		total_height = height + margin*2;
	}
}