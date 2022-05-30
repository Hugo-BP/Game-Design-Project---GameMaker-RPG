

if (state == INIT)
{
	// get random unblocked locations
	
	var hcells = (room_width div TILESIZE) -1;
	var vcells = (room_height div TILESIZE) -1;
	var attempts = 0;
	var locs = 0;
	

	
	//while (locs < MAX_SPAWNS_PER_ROOM and attempts < 100)
	//{
	//	var sp_x = irandom(hcells);
	//	var sp_y = irandom(vcells);
	
		
	//	var check_x = sp_x * TILESIZE;
	//	var check_y = sp_y * TILESIZE;
		
	//	// check if blocked
	//	layer_id = layer_get_id("Tiles_Collision");
	//	tilemap_id = layer_tilemap_get_id(layer_id);
		
	//	// if not on a collision tile
	//	if ( tilemap_get_at_pixel(tilemap_id, check_x, check_y) == 0 )
	//	{
	//		spawn_loc[locs, X_COORD] = check_x;
	//		spawn_loc[locs, Y_COORD] = check_y;
	//		locs++;
	//	}
	//	attempts++;
	//}

	spawn_loc[0, X_COORD] = 120;
	spawn_loc[0, Y_COORD] = 120;
	
	spawn_loc[1, X_COORD] = 80;
	spawn_loc[1, Y_COORD] = 120;
	
	spawn_loc[2, X_COORD] = 40;
	spawn_loc[2, Y_COORD] = 120;

	// Create Villagers
	for (var i=0 ; i < 3 ; i++)
	{
		// Create NPC
		spawns[i] = instance_create_layer(spawn_loc[i, X_COORD], spawn_loc[i, Y_COORD], "Instance_Other", objNPC_Friendly);
		spawns[i].index = i;
		spawns[i].class = global_arr_friendlies[friendlies.villager, CLASS];
		spawns[i].npc_name = global_arr_friendlies[friendlies.villager, NAME];
		spawns[i].npc_text = global_arr_friendlies[friendlies.villager, TEXT];
		spawns[i].can_trade = true;
		spawns[i].trade_items = ["maple herb",20]; // TODO modular array, item id
		spawns[i].can_give_quest = false;
	}
	state = READY;
}





