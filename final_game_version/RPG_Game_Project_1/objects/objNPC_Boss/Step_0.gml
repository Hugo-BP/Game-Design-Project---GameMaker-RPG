

if (state == INIT)
{
	spawn_loc[0, X_COORD] = 215;
    spawn_loc[0, Y_COORD] = 230;
	
	// Create Spawner obj
	spawn = instance_create_layer(spawn_loc[0, X_COORD], spawn_loc[0, Y_COORD], "Instance_Other", objBattleSpawner);
	spawn.battleroom = manager_battle_room;
	spawn.manager = id;
	
	// Choose Units max 5
	party_size = MAX_NPC_GROUP_SIZE-1;
	
	for (var n=0 ; n < party_size ; n++)
	{	
		// choose random classes of units
		enemy = choose(enemies.skeleton_knight, enemies.skeleton_archer, enemies.zombie, enemies.demon, enemies.evil_eye);
		spawn.units[n] = global_arr_enemies[enemy];
	}
	
	enemy = enemies.lich;
	spawn.units[n] = global_arr_enemies[enemy];
	// Spawner Avatar is a random unit from the chosen ones
	
	spawn.anim_idle = spawn.units[n, ANIM_IDLE]; 

	state = READY;
}

if (state == READY)
{
	with(objBattleSpawner){
		
		visible = false;
		
	}
}




