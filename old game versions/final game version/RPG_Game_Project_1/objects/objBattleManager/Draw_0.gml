if (state != STAND_BY) 
{
	// MENU DRAW
	draw_set_halign(fa_left);
	draw_set_halign(fa_top);
	draw_set_color(c_white);
	draw_set_font(Font);

	font_size = font_get_size(Font);

	cbt_menu_x_start = sprite_get_width(sprPointer) * 1.6;
	cbt_menu_y_start = 2;

	var t_x = 0;
	var t_y = 2;

	if (menu_state == DECISION_MENU)
	{
		// if not yet decided on attacking, allow decision menu to be drawn

			for (var i=0 ; i < array_length(cbt_menu_arr) ; i++)
			{
				// MENU OPTIONS
				menu_increment = i * (font_size - BUFFER);
				draw_text(cbt_menu_x_start, cbt_menu_y_start + menu_increment, cbt_menu_arr[i]);
	
				if (menu_option_state != ATTACK)
				{
					// MENU ARROW
					if (menu_option_index == i)
					{
						cbt_menu_pointer_x = sprite_get_width(sprPointer);
						cbt_menu_pointer_y = cbt_menu_y_start + menu_increment + sprite_get_height(sprPointer)/2 ;
		
						draw_sprite(sprPointer, 0, cbt_menu_pointer_x, cbt_menu_pointer_y);
					}
				}
			}

		// if selecting attack target draw pointer
		if (menu_option_state == ATTACK or menu_option_state == SELECT_ITEM_TARGET)
		{
			t_x = selected_target.x;
			t_y = selected_target.y - selected_target.sprite_height + sprite_get_height(sprPointer)/3;
			draw_sprite_ext(sprPointer, 0, t_x, t_y, 0.75, 1, 270, c_white, 1);
		}
	
		// if selecting spell show spells
		if (menu_option_state == SPELL)
		{
			n_spells = ds_list_size(ds_spellbook);
			increment =  n_spells * (font_size + BUFFER);
			spl_x = BUFFER + (font_size * 4) + string_width("XXX_HP_1000/1000__AP_200/200_");
			spl_y = 2;
		
			draw_text(spl_x, spl_y, " SPL ");
			spl_x += string_width("_SPL") + sprite_get_width(sprPointer);
		
			// IF THERES SPELLS
			if (n_spells > 0)
			{
				for (var spells=0 ; spells < ds_list_size(ds_spellbook) ; spells++)
				{
					// MENU
					var spell_id = ds_list_find_value(ds_spellbook, spells);
					var spell_name = global_arr_spellbook[spell_id];
				
					draw_text(spl_x, spl_y + (spells * (font_size - BUFFER)), spell_name);
				
					// MENU ARROW
					if (spells == magic_selected_spell)
					{
						magic_menu_pointer_x = spl_x - sprite_get_width(sprPointer)/2 -1;
						magic_menu_pointer_y = spl_y + (spells * (font_size - BUFFER)) + sprite_get_height(sprPointer)/2;
		
						draw_sprite(sprPointer, 0, magic_menu_pointer_x, magic_menu_pointer_y);
					}
				}
			}
			// THERE ARE NO SPELLS
			else
			{
				draw_text(spl_x, spl_y, "UNKNOWN");
			}
		}
	
		// DISPLAY INVENTORY
		if (menu_option_state == INV)
		{
			// MENU DRAW INIT VARS
			n_items = INVENTORY_SIZE;
			increment =  n_items * (font_size + BUFFER);
			inv_x = BUFFER + (font_size * 4) + string_width("XXX_HP_1000/1000__AP_200/200_");
			inv_y = 2;
		
			draw_text(inv_x, inv_y, " INV ");
			inv_x += string_width("_INV") + sprite_get_width(sprPointer);
		
			for (var items=0 ; items < INVENTORY_SIZE ; items++)
			{
				if (global_arr_inv[ds_list_find_value(ds_players, 0).index, items] == "")
				{
					item_text = "empty"
				}
				else 
				{
					item_text = global_arr_inv[ds_list_find_value(ds_players, 0).index, items][item_stats.item_name];
					//item_text = global.item_arr[global_arr_inv[selected_player, items], item_stats.item_name];
				}
			
				// MENU ITEMS
				draw_text(inv_x, inv_y + (items * (font_size - BUFFER)), item_text);
					
				// MENU ARROW
				if (items == inv_selected_item)
				{
					inv_menu_pointer_x = inv_x - sprite_get_width(sprPointer)/2 -1;
					inv_menu_pointer_y = inv_y + (items * (font_size - BUFFER)) + sprite_get_height(sprPointer)/2;
		
					draw_sprite(sprPointer, 0, inv_menu_pointer_x, inv_menu_pointer_y);
				}
			}
		}
	}

	// combat stats
	n_players = array_length(global_arr_players);
	increment =  n_players * (font_size + BUFFER);
	cbt_x = BUFFER + (font_size * 4);
	cbt_y = 2;

	for (var i=0 ; i < n_players ; i++)
	{
		str_name =  string_copy(string(global_arr_players[i, NAME]), 1, 3);
		str_hp = " HP " + string(global_arr_players[i, MAX_HP]) + "/" + string(global_arr_players[i, CURR_HP]);
		str_ap = " AP " + string(global_arr_players[i, MAX_AP]) + "/" + string(global_arr_players[i, CURR_AP]);;
		draw_text(cbt_x, cbt_y + (i * (font_size - BUFFER)), str_name);
		draw_text(cbt_x + string_width("XXX_"), cbt_y + (i * (font_size - BUFFER)), str_hp);
		draw_text(cbt_x + string_width("XXX_HP_1000/1000_"), cbt_y + (i * (font_size - BUFFER)), str_ap);
	}

	if (state == BATTLE_END)
	{
		draw_set_color(c_white);

		draw_text(room_width/3, room_height/3, end_text);
		draw_text((room_width/3) + (font_size - BUFFER)*3, (room_height/3)+(font_size - BUFFER + 1), "Press Space to Continue...");
	}
	
}


