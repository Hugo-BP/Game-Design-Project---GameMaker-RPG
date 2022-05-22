

// Combat events switch logic
switch(combat_phase)
   {
   case cbt_phase.init:
		with (oPlayer_parent){instance_destroy();}
		with (oNPC_parent){instance_destroy();}
   
   
		// SPAWN HERO PARTY
		party_size = array_length((ga_heroes)); 
		for (var i=0 ; i<party_size ; i++)
		{
			hero = instance_create_depth(hero_spawn_pos[i, X_COORD], hero_spawn_pos[i, Y_COORD], -100, oPlayer_parent)
			hero.player_state = BUSY;
			hero.is_in_combat = true;
			hero.index = i;
		}
		
		// SPAWN NPC PARTY
		party_size = array_length((ga_npcs)); 
		for (var i=0 ; i<party_size ; i++)
		{
			npc = instance_create_depth(npc_spawn_pos[i, X_COORD], npc_spawn_pos[i, Y_COORD], -100, oNPC_parent)
		}
		
		player_turn = true;
		ds_heroes = -1;
		player_turn_phase = INIT;
		
		combat_phase = cbt_phase.start_turn;
   break;
   
   case cbt_phase.start_turn:
		if (player_turn) 
		{
			// delete old hero list
			if (player_turn_phase == INIT)
			{
				if (ds_exists(ds_heroes, ds_type_list))
				{
					ds_list_destroy(ds_heroes);
					ds_heroes = -1;
				}
			}
			
			// create updated hero list
			ds_heroes = ds_list_create();
			with (oPlayer_parent)
			{
				if (ga_heroes[index, 2] > 0) 
				{
					ds_list_add(other.ds_heroes, id);
					//show_debug_message(ds_heroes);
				}
				player_turn_phase = READY;
			}

			// select an hero and remove it from list
			if (player_turn_phase == READY)
			{

				if (keyboard_check_pressed(vk_space))
				{
					select_hero = ds_list_find_value(ds_heroes, 0);
					ds_list_delete(ds_heroes, 0);
				
					select_hero.is_attacking = true;
				}
			}
			// once list is empty, restart
			if (ds_list_size(ds_heroes) < 0)
			{
				player_turn_phase = INIT;
			}
			
		}
		
		combat_phase = cbt_phase.wait;
   break;
   
   case cbt_phase.wait:
		combat_phase = cbt_phase.process;
   
   break;
   
   case cbt_phase.process:
		combat_phase = cbt_phase.check_finished;
   
   break;
   
   // check finish will lead to either - 1-END 2-WIN 3-LOSE 
   case cbt_phase.check_finished:
		if (keyboard_check_released(ord("1"))) 
		{
			combat_phase = cbt_phase.end_turn;
		}
		else if (keyboard_check_released(ord("2"))) 
		{
			combat_phase = cbt_phase.win;
		}
		else if (keyboard_check_released(ord("3"))) 
		{
			combat_phase = cbt_phase.lose;
		}
		
   break;
   
   case cbt_phase.end_turn:
		combat_phase = cbt_phase.start_turn;
   
   break;
   
   // EXIT COMBAT CASES
   case cbt_phase.win:
		// GO BACK TO MAIN GAME INSTANCE
   
   break;
   
   case cbt_phase.lose:
		combat_phase = cbt_phase.init;
		// GO BACK TO LAST SAVE HUB
   
   break;
   
   }
