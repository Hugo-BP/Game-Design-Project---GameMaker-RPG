/// @description Insert description here
// You can write your code in this editor

#region  Draw collected items
var margin = 5;
for( var entry = 0; entry < ds_list_size(global.inventory); entry++){
	var item = global.inventory[| entry];
	
	#region
	
	var xoffset = sprite_get_xoffset(spr_items);
	var yoffset = sprite_get_yoffset(spr_items);
	var spr_w = sprite_get_width(spr_items) + margin;
	
	var draw_x = margin + (xoffset +(entry * spr_w) );
	var draw_y = (margin * 2) + yoffset;
	
	#endregion
	
	if(item != undefined){
		draw_sprite(spr_items, item, draw_x, draw_y);
		
		#region
		
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_set_color(c_white);
		draw_text(draw_x, draw_y, string(item) );
		
		#endregion
	}
	
	if(selected_item == entry)
	draw_sprite(spr_selected_item,0,draw_x,draw_y);
}

#endregion

draw_text(0,0,"Hp : " + string(global.playerHP));
