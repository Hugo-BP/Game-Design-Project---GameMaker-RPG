
function ScriptPlayerCollision(){

	// Check Horizontal Tile 
	if (tilemap_get_at_pixel(tilemap_id, x + x_movement, y))
	{
		x -= x mod TILESIZE;
		if (sign(x_movement) == 1)	
		{
			x += TILESIZE -1;
		}
		x_movement = 0;
	}

	// Commit to Horizontal Movement
	x += x_movement;

	// Check Vertical Tile 
	if (tilemap_get_at_pixel(tilemap_id, x, y + y_movement))
	{
		y -= y mod TILESIZE;
		if (sign(y_movement) == 1)	
		{
			y += TILESIZE -1;
		}
		y_movement = 0;
	}

	// Commit to Vertical Movement
	y += y_movement;

}