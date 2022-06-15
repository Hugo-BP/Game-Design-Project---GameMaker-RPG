
// some npcs should be random, others shouldnt (ex. store clerks)
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
	
	spawn_loc[1, X_COORD] = 560;
	spawn_loc[1, Y_COORD] = 70;
	
	spawn_loc[2, X_COORD] = 530;
	spawn_loc[2, Y_COORD] = 330;

	// Create Villagers
	//for (var i=0 ; i < 2 ; i++)
	//{
	i = 0;
	// Create NPC
	spawns[i] = instance_create_layer(spawn_loc[i, X_COORD], spawn_loc[i, Y_COORD], "Instance_Other", objNPC_Friendly);
	spawns[i].index = i;
	spawns[i].class = global_arr_friendlies[friendlies.villager, CLASS];
	spawns[i].npc_name = global_arr_friendlies[friendlies.villager, NAME];
	spawns[i].npc_text = global_arr_friendlies[friendlies.villager, TEXT];
	spawns[i].anim_idle = global_arr_friendlies[friendlies.villager, ANIM_IDLE];
	spawns[i].can_trade = true;
	spawns[i].is_shop = false;
	spawns[i].trade_items = ["Apple", 2]; // global_arr_friendlies[friendlies.villager, STORE]; 
	spawns[i].can_give_quest = false;
	
	i = 1;
	// Create NPC
	spawns[i] = instance_create_layer(spawn_loc[i, X_COORD], spawn_loc[i, Y_COORD], "Instance_Other", objNPC_Friendly);
	spawns[i].index = i;
	spawns[i].class = global_arr_friendlies[friendlies.villager, CLASS];
	spawns[i].npc_name = global_arr_friendlies[friendlies.villager, NAME];
	spawns[i].npc_text = global_arr_friendlies[friendlies.villager, TEXT];
	spawns[i].anim_idle = global_arr_friendlies[friendlies.villager, ANIM_IDLE];
	spawns[i].can_trade = true;
	spawns[i].is_shop = false;
	spawns[i].trade_items = ["Maple Herb", 20]; // global_arr_friendlies[friendlies.villager, STORE]; 
	spawns[i].can_give_quest = false;

	i = 2;
	
	// Create NPC
	spawns[i] = instance_create_layer(spawn_loc[i, X_COORD], spawn_loc[i, Y_COORD], "Instance_Other", objNPC_Friendly);
	spawns[i].index = i;
	spawns[i].class = global_arr_friendlies[friendlies.villager, CLASS];
	spawns[i].npc_name = global_arr_friendlies[friendlies.villager, NAME];
	spawns[i].npc_text = global_arr_friendlies[friendlies.villager, TEXT];
	spawns[i].anim_idle = global_arr_friendlies[friendlies.villager, ANIM_IDLE];
	spawns[i].can_trade = false;
	spawns[i].is_shop = false;
	spawns[i].trade_items = global_arr_friendlies[friendlies.villager, STORE]; 
	spawns[i].can_give_quest = false;

	
	i = 3;
	spawn_loc[i, X_COORD] = 550;
	spawn_loc[i, Y_COORD] = 210;
	// Create NPC
	spawns[i] = instance_create_layer(spawn_loc[i, X_COORD], spawn_loc[i, Y_COORD], "Instance_Other", objNPC_Friendly);
	spawns[i].index = i;
	spawns[i].class = global_arr_friendlies[friendlies.inn_keeper, CLASS];
	spawns[i].npc_name = global_arr_friendlies[friendlies.inn_keeper, NAME];
	spawns[i].npc_text = global_arr_friendlies[friendlies.inn_keeper, TEXT];
	spawns[i].anim_idle = global_arr_friendlies[friendlies.inn_keeper, ANIM_IDLE];
	spawns[i].can_trade = true;
	spawns[i].is_shop = true;
	spawns[i].trade_items = global_arr_friendlies[friendlies.inn_keeper, STORE];
	spawns[i].can_give_quest = false;
	
	i = 4;
	spawn_loc[i, X_COORD] = 200;
	spawn_loc[i, Y_COORD] = 300;
	// Create NPC
	spawns[i] = instance_create_layer(spawn_loc[i, X_COORD], spawn_loc[i, Y_COORD], "Instance_Other", objNPC_Friendly);
	spawns[i].index = i;
	spawns[i].class = global_arr_friendlies[friendlies.villager, CLASS];
	spawns[i].npc_name = global_arr_friendlies[friendlies.villager, NAME];
	spawns[i].npc_text = global_arr_friendlies[friendlies.villager, TEXT];
	spawns[i].anim_idle = global_arr_friendlies[friendlies.villager, ANIM_IDLE];
	spawns[i].can_trade = false;
	spawns[i].is_shop = false;
	spawns[i].trade_items = global_arr_friendlies[friendlies.villager, STORE];
	spawns[i].can_give_quest = true;
	
	
	state = READY;
}

if (state == READY)
{
	if ((global.warp_destination != manager_room))
	{
		// if the player leaves room then all npcs are deleted (ex. starts combat).
		// by deleting the manager, if player returns to room then npcs are spawned again
		instance_destroy();
	}
}



