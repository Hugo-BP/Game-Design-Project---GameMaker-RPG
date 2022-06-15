

if (state == INIT)
{
	// get random unblocked locations
	var hcells = (room_width div TILESIZE) -1;
	var vcells = (room_height div TILESIZE) -1;
	var attempts = 0;
	var locs = 0;
	
	while (locs < 1 and attempts < 100)
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

	// Create Spawner obj
	spawn = instance_create_layer(spawn_loc[0, X_COORD], spawn_loc[0, Y_COORD], "Instance_Other", objBattleSpawner);
	spawn.battleroom = manager_battle_room;
	spawn.manager = id;
	
	// Choose Units max 5
	party_size = round(random_range(1, MAX_NPC_GROUP_SIZE));
	for (var n=0 ; n < party_size ; n++)
	{	
		// choose random classes of units
		enemy = choose(enemies.skeleton_knight, enemies.skeleton_archer, enemies.zombie, enemies.demon, enemies.evil_eye);
		spawn.units[n] = global_arr_enemies[enemy];
	}
	// Spawner Avatar is a random unit from the chosen ones
	sp = random_range(0, array_length(spawn.units));
	spawn.anim_idle = spawn.units[sp, ANIM_IDLE]; 


	state = READY;
}

if (state == READY)
{
	//if ((global.warp_destination != manager_room) and (global.warp_destination != manager_battle_room) and spawn != noone)
	//{
	//	// if the player leaves room then all npcs are deleted (ex. starts combat).
	//	// by deleting the manager, if player returns to room then npcs are spawned again
	//	instance_destroy(spawn);
	//	instance_destroy();
	//}
	
	// if spawn was killed off then start respawn timer
	if (spawn == noone)
	{
		if (cs > cooldown)
		{
			state = INIT;
		}
		cs++;
	}
}




