function ScriptAnimateSprite()
{
	if (not global.player_menu_state)
	{
		// Convert 360 degrees into 4 directions
		var cardinal_direction = round(direction/90);

		// Get size of spritesheet with all movement animations and divide it by the number of different movements ( WASD )
		var total_frames = sprite_get_number(sprite_index) / 4;

		// animate by incrementing index
		image_index = curr_frame + (cardinal_direction * total_frames);
		curr_frame += sprite_get_speed(sprite_index) / FRAME_RATE;

		// on animation loop:
		if (curr_frame >= total_frames)
		{
			animation_end = true;
			curr_frame -= total_frames;
		} 
		else 
		{
			animation_end = false;
		}
	}
}
