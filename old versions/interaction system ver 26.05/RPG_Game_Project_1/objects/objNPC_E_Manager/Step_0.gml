

if (state == INIT)
{
	// get random unblocked locations
	
	var hcells = (room_width div TILESIZE) -1;
	var vcells = (room_height div TILESIZE) -1;
	var attempts = 0;
	var locs = 0;
	

	
	while (locs < MAX_SPAWNS_PER_ROOM and attempts < 100)
	{
		var sp_x = irandom(hcells);
		var sp_y = irandom(vcells);
	
		
		var check_x = sp_x * TILESIZE;
		var check_y = sp_y * TILESIZE;
		
		// check if blocked
		layer_id = layer_get_id("Tiles_Collision");
		tilemap_id = layer_tilemap_get_id(layer_id);
		
		// if not on a collision tile
		if ( tilemap_get_at_pixel(tilemap_id, check_x, check_y) == 0 )
		{
			spawn_loc[locs, X_COORD] = check_x;
			spawn_loc[locs, Y_COORD] = check_y;
			locs++;
		}
		attempts++;
	}

	// Create Spawner
	for (var i=0 ; i < MAX_SPAWNS_PER_ROOM ; i++)
	{
		// Create Spawner obj
		spawns[i] = instance_create_layer(spawn_loc[i, X_COORD], spawn_loc[i, Y_COORD], "Instance_Other", objBattleSpawner);
		spawns[i].index = i;
		
		// Choose Battleroom
		spawns[i].battleroom = BattleRoom_0;

		party_size = round(random_range(1, MAX_NPC_GROUP_SIZE));
		// Choose Units max 5
		for (var n=0 ; n < party_size ; n++)
		{	
			// choose random classes of units
			enemy = choose(enemies.skeleton_knight, enemies.skeleton_archer, enemies.demon, enemies.evil_eye);
			spawns[i].units[n] = global_arr_enemies[enemy];
		}
		// Spawner Avatar is a random unit from the chosen ones
		sp = random_range(0, array_length(spawns[i].units));
		spawns[i].anim_idle = spawns[i].units[sp, ANIM_IDLE]; 
	}

	state = READY;
}

if (state == READY)
{
	if (array_length(spawns) <= 0 )
	{
		if (cs > cooldown)
		{
			state = INIT;
		}
		cs++;
	}

}




