
draw_sprite_stretched(sprGenericMenu, 0, x-margin, y-margin, total_width, total_height);

draw_set_colour(c_white);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(FontGenericMenu);

// MAX 5 options
if (output_type = M_OPTIONS)
{
	// draw all the options and the arrow pointing to the selected option
	var desc_exists = !(desc == -1);
	for (var i = first_line ; i < nr_lines + desc_exists ; i++)
	{
		// draw title
		if (i == first_line and desc_exists)
		{
			draw_set_font(FontGenericMenuTitle);
			draw_text(x, y-5, "  " + desc);
		
		}
		else 
		{
			// draw options
			var text = options[i - desc_exists][0];
			if (selected == i - desc_exists)
			{
				text = text_pointer + text;
			}
			draw_set_font(FontGenericMenu);
			draw_text(x, y + i * font_get_size(FontGenericMenu), "    " + text);
		
		}
	}
}

// MAX 4 lines of text
if (output_type = M_TEXT)
{
	// draw wall of text
	var desc_exists = !(desc == -1);
	var t = 0;
	for (var i = first_line ; i < final_line + desc_exists ; i++)
	{
		// draw title
		if (t == 0 and desc_exists)
		{
			draw_set_font(FontGenericMenuTitle);
			draw_text(x, y-5, "  " + desc);
		
		}
		else 
		{
			// draw 4 lines of text. if click on space lines go from 0-4 to 1-5 and so on
			// once final line is reached, close menu.
			var text = options[i - desc_exists][0];
			
			draw_set_font(FontGenericMenu);
			draw_text(x, y + t * font_get_size(FontGenericMenu), "    " + text);
			
			if (final_line < nr_lines)
			{
				menu_x = view_wport[0] * 0.90;
				menu_y = view_hport[0] - (font_get_size(FontGenericMenu) + 2*INTERACTION_MENU_MARGIN);
				draw_sprite_ext(sprPointer, 0, menu_x, menu_y, 4, 5, 270, image_blend, image_alpha);
			}
		}
		t++;
	}
}





