
draw_set_colour(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_left);
draw_set_font(FontGenericMenu);

start_x = view_wport[0] * 0.1;
start_y = view_hport[0] * 0.1;

margin_x = view_wport[0] * 0.05;
margin_y = view_hport[0] * 0.05;

total_width = ( view_wport[0] * 0.8 ) + 2 * margin_x;
total_height = ( view_hport[0] * 0.8 ) + 2 * margin_y;

// INVENTORY

draw_sprite_stretched(sprGenericMenu, 0, start_x-margin_x, start_y-margin_y, total_width, total_height);

var x_text_pos = start_x + ( string_length("INVENT")*font_get_size(FontGenericMenu) );
draw_text(x_text_pos, start_y, "INVENTORY");

var x_text_pos = start_x + ( string_length("INVENTORY")*font_get_size(FontGenericMenu) + ( string_length("EQU")*font_get_size(FontGenericMenu) + margin_x ));
draw_text(x_text_pos, start_y, "EQUIP");

var x_text_pos = total_width - ( string_length("PARTY ")*font_get_size(FontGenericMenu) ) - start_x;
draw_text(x_text_pos, start_y, "PARTY STATUS");

start_y += 2 * font_get_size(FontGenericMenu);

var counter = 0;
	
for (var rows = 0 ; rows < nr_rows ; rows++)
{
	for (var cols = 0 ; cols < nr_cols ; cols++)
	{
		xx = start_x + (rows * grid_size);
		yy = start_y + (cols * grid_size);
			
		draw_sprite_ext(sprInv, 0, xx, yy, 2, 2, 0, image_blend, image_alpha);

	
		var item = global.inventory[counter, item_slot.item_id];
			
		if (item > -1)
		{
			draw_sprite_ext(sprItems, item, xx, yy, 2, 2, 0, image_blend, image_alpha);
		}
		
		selected_option = sel_row + (nr_cols * sel_col);
		if (selected_option == counter)
		{
			draw_sprite_ext(sprInv, 1, xx, yy, 2, 2, 0, image_blend, image_alpha);
		}
		counter++;
	}
}

// EQUIPED ITEMS
for (var rows = 0 ; rows < 2 ; rows++)
{
	for (var cols = 0 ; cols < 6 ; cols++)
	{
		xx = start_x + ((rows + nr_rows) * grid_size) + grid_size/3;
		yy = start_y + (cols * grid_size);
			
		draw_sprite_ext(sprInv, 0, xx, yy, 2, 2, 0, image_blend, image_alpha);
	}
}

// STATS

font_size = font_get_size(FontGenericMenu);
draw_set_halign(fa_left);
n_players = array_length(global_arr_players);
increment =  n_players * (font_size + BUFFER);
cbt_x = start_x + total_width/2 - margin_x;
cbt_y = start_y - margin_y/2;

for (var i=0 ; i < n_players ; i++)
{
	str_name = global_arr_players[i, NAME];
	str_hp = "   HP " + string(global_arr_players[i, MAX_HP]) + "/" + string(global_arr_players[i, CURR_HP]);
	str_ap = " AP " + string(global_arr_players[i, MAX_AP]) + "/" + string(global_arr_players[i, CURR_AP]);
	str_hp += str_ap;
		
	str_lvl = "   LVL " + string(global_arr_players[i, LEVEL]);
	str_exp = " EXP " + string(global_arr_players[i, EXP]);
	str_lvl += str_exp;
		
	str_cls = "   CLASS " + string(global_arr_players[i, CLASS]);

		
	draw_text(cbt_x + margin_x, cbt_y + (i * 4 * (font_size - BUFFER)), str_name);
	draw_text(cbt_x + margin_x, cbt_y + (i * 4 * (font_size - BUFFER)) + (font_size - BUFFER), str_hp);
	draw_text(cbt_x + margin_x, cbt_y + (i * 4 * (font_size - BUFFER)) + (font_size - BUFFER)*2, str_lvl);
	draw_text(cbt_x + margin_x, cbt_y + (i * 4 * (font_size - BUFFER)) + (font_size - BUFFER)*3, str_cls);
}

















