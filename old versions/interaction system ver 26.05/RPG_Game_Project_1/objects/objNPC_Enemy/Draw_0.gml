if (state == READY)
{
	draw_self();
	
	draw_set_halign(fa_center);
	draw_set_halign(fa_bottom);
	draw_set_color(c_white);
	
	if (is_stunned > 0)
	{
		// TODO CHANGE ANIMATION SPRITE
		draw_text(x + string_width("*STUN")-1, y - sprite_height/2, "*STUNNED*")
	}
	
}







