
if (global.player_menu_state)	
{	
	menu_x = view_wport[0] * 0.40;
	menu_y = 2*INTERACTION_MENU_MARGIN;
	
	width = view_wport[0]*0.2;
	height = view_hport[0]*0.8;		
	
	total_width = width;
	total_height = height;

	draw_sprite_stretched(sprGenericMenu, 0, menu_x, menu_y, total_width, total_height);

	draw_set_colour(c_white);
	draw_set_halign(fa_center);
	draw_set_valign(fa_left);
	draw_set_font(FontGenericMenu);
	
	// draw all the options
	for (var i = 0 ; i < nr_options_pm-1 ; i++)
	{
		// draw options
		var text = global.player_menu_text[i];
		if (selected_pm == i)
		{
			text = " > " + text + " < ";
		}
		draw_text(menu_x+total_width/2, (menu_y*4) + i * font_get_size(FontGenericMenu), text);
	}
	
	var text = global.player_menu_text[nr_options_pm-1];
	if (selected_pm == nr_options_pm-1)
	{
		text = " > " + text + " < ";
	}
	draw_text(menu_x+total_width/2, menu_y + total_height*0.8 + font_get_size(FontGenericMenu), text);
}
