if (not global.player_menu_state)
{
	
switch(state)
{
	#region INIT/RESET CODE
	case INIT:
		turn_timer = 0;
		// Create target list
		if (ds_exists(ds_selectable_npc, ds_type_list))
		{
			ds_list_destroy(ds_selectable_npc);
			ds_selectable_npc = -1;
		}
		if (ds_exists(ds_selectable_player, ds_type_list))
		{
			ds_list_destroy(ds_selectable_player);
			ds_selectable_player = -1;
		}
		
		ds_selectable_npc = ds_list_create();
		ds_selectable_player = ds_list_create();
		
		// Clean old objects
		with (objPlayer)
		{
			instance_destroy();
		}
		with (objNPC_Enemy)
		{
			instance_destroy();
		}
		
		var player_initiative = 0;
		var npc_initiative = 0;
		
		// SPAWN PLAYER PARTY
		for (var i=0 ; i < array_length(global_arr_players) and i < MAX_HERO_GROUP_SIZE ; i++)
		{
			player = instance_create_depth(player_spawn_pos[i, X_COORD], player_spawn_pos[i, Y_COORD], -100, objPlayer)
			
			player.x = player_spawn_pos[i, X_COORD];
			player.y = player_spawn_pos[i, Y_COORD];
			
			player.index = i;
			player.class = global_arr_players[player.index, CLASS]; 
			player.name = global_arr_players[player.index, NAME]; 
			
			// BATTLE STATUSES
			player.is_in_battle = true;
			player.is_attacking = false;
			player.is_defending = false;
			player.is_corrupted = false;
			player.corruption = 0;
			player.is_stunned = 0; // TODO ADD ANIMATIONS FOR STUNNED STATE / SPELLS / ETC
			player.is_dead = false;
			player.is_exploring = false;

			player.state = INIT;
			
			// ANIMATION
			player.anim_idle = global_arr_players[player.index, ANIM_IDLE]; 
			player.anim_attack = global_arr_players[player.index, ANIM_ATTACK]; 
			player.anim_dead = global_arr_players[player.index, ANIM_DEAD]; 
			
			// for menu selecting a player to attack
			ds_list_add(ds_selectable_player, player);
			
			player_initiative += global_arr_players[player.index, INITIATIVE];
		}
		
		// SPAWN NPC PARTY
		for (var i=0 ; i < array_length(global_spawner_units) and i < MAX_NPC_GROUP_SIZE ; i++)
		{
			npc = instance_create_depth(npc_spawn_pos[i, X_COORD], npc_spawn_pos[i, Y_COORD], -100, objNPC_Enemy)
			
			npc.index = i;
			npc.class = global_spawner_units[npc.index, CLASS];
			npc.npc_name = global_spawner_units[npc.index, NAME];
			npc.npc_curr_hp = global_spawner_units[npc.index, CURR_HP];
			npc.npc_max_hp = global_spawner_units[npc.index, MAX_HP];
			npc.npc_damage = global_spawner_units[npc.index, MAX_WEAPON_DAMAGE];
			
			// BATTLE STATUSES
			npc.is_in_battle = true;
			npc.is_attacking = false;
			npc.is_defending = false;
			npc.is_corrupted = false;
			npc.corruption = 0;
			npc.is_stunned = 0;
			npc.is_dead = false;
			
			npc.has_healed = 0;
			
			npc.state = INIT;
			
			// ANIMATION
			npc.anim_idle = global_spawner_units[npc.index, ANIM_IDLE]; 
			npc.anim_attack = global_spawner_units[npc.index, ANIM_ATTACK]; 
			npc.anim_dead = global_spawner_units[npc.index, ANIM_DEAD]; 
			
			// for menu selecting a npc to be attacked
			ds_list_add(ds_selectable_npc, npc);
			
			npc_initiative += global_spawner_units[npc.index, INITIATIVE];
		}
		
		// Clean up lists
		if (ds_exists(ds_players, ds_type_list))
		{
			ds_list_destroy(ds_players);
			ds_players = -1;
		}
		if (ds_exists(ds_npcs, ds_type_list))
		{
			ds_list_destroy(ds_npcs);
			ds_npcs = -1;
		}
		if (ds_exists(ds_spellbook, ds_type_list))
		{
			ds_list_destroy(ds_spellbook);
			ds_spellbook = -1;
		}
		
		// INIT MENU
		menu_state = DECISION_MENU;	 // POSSIBLE MENUS = DECISIONS SPELLS ITEMS
		menu_option_index = 0;		 // iterate between option indexes
		menu_option_state = DECIDING;// allow player to iterate between options while undecided
		magic_menu_state = CHOOSING_SPELL;
		selected_player = 0; // used to draw pointer on selected player
		
		inv_selected_item = 0;
		magic_selected_spell = 0;
		
		// target to be attacked, can be player or npc
		selected_target = noone;
		// attacker index to iterate menu lists
		curr_target = 0;
	
		// timer for attack animation duration
		attack_timer = 0;
		switch_turns_timer = 0;
		
		
		if (player_initiative > npc_initiative)
		{
			player_turn = true;
		}
		else
		{
			player_turn = false;
		}
		
		// current turn status
		turn_status = INIT;
		
		// battle manager ready
		end_timer = 0;
		state = READY;
	break;
	#endregion
	
	
	case READY:
		// PLAYER TURN
		#region PLAYER_TURN
		if (player_turn) 
		{
			// INITIALIZE TURN
			if (turn_status == INIT)
			{
				// CLEAN UP PLAYER LIST
				if (ds_exists(ds_players, ds_type_list))
				{
					ds_list_destroy(ds_players);
					ds_players = -1;
				}
				ds_players = ds_list_create();
		
				// update hero list
				with (objPlayer)
				{
					// if hero HP is more than zero then add to fighters
					if (global_arr_players[index, CURR_HP] > 0) 
					{
						ds_list_add(other.ds_players, id);
					}
					// increment stun status
					if (is_stunned > 0)
					{
						is_stunned--;
					}
					// reset def status
					is_defending = false;
				}
				// sort list of players so the order is middle top bottom back
				ds_list_sort(ds_players, true);
				
				// CLEAN UP NPC LIST
				if (ds_exists(ds_npcs, ds_type_list))
				{
					ds_list_destroy(ds_npcs);
					ds_npcs = -1;
				}
				ds_npcs = ds_list_create();
		
				// update npc list
				with (objNPC_Enemy)
				{
					// if npc HP is more than zero then add to fighters
					if (npc_curr_hp > 0)
					{
						ds_list_add(other.ds_npcs, id);
					}
				}

				menu_state = DECISION_MENU; 
				menu_option_index = 0;
				
				turn_status = READY;
			}
		
			// select an hero and remove it from list
			if (turn_status == READY)
			{	
				// PLAYER MAIN MENU ITERATION - ATK DEF SPL INV RUN
				if (menu_state == DECISION_MENU)
				{
					if (menu_option_state == DECIDING)
					{
						// IF PLAYER IS STUNNED THEN SKIP TURN
						if ( ds_list_find_value(ds_players, 0).is_stunned > 0 )
						{
							ds_list_delete(ds_players, 0);
							
							selected_player++;
							menu_state = DECISION_MENU;
						}
						
						if (keyboard_check_pressed(UP_KEY))
						{
							if (menu_option_index-1 >= 0)
							{
								menu_option_index--;
							}
							else
							{
								menu_option_index = array_length(cbt_menu_arr) -1;
							}
						}
						if (keyboard_check_pressed(DOWN_KEY))
						{
							if (menu_option_index+1 < array_length(cbt_menu_arr))
							{
								menu_option_index++;
							}
							else
							{
								menu_option_index = 0;
							}
						}
					}
					
					#region PLAYER_SECONDARY_MENU
					if (keyboard_check_pressed(CONTINUE_KEY))
					{
						// cbt_menu_arr possible : 0-atk 1-def 2-spell 3-inv 4-run
						
						// ATTACK SELECTED
						if(menu_option_index == 0)
						{
							// If not attacking yet
							if(menu_option_state != ATTACK)
							{
								// get default target for meele
								with(objNPC_Enemy)
								{
									if (index >= 0) // if theres atleast 1 entity
									{
										other.selected_target = id;
										break;
									}
								}
								// Reset 
								curr_target = 0;
								// Update state
								menu_option_state = ATTACK
							}
							else
							{
								// ATTACK 
								// select an hero
								curr_player = ds_list_find_value(ds_players, 0);
								ds_list_delete(ds_players, 0);
								
								if (curr_player.is_corrupted)
								{
									ScriptApplyDamage(curr_player.corruption, curr_player, "CORRUPT");
								}
								
								curr_spell = -1;
								
								// for player pointer that tells which player is curr attacking
								selected_player++;
								
								// whether its meele or magic spell
								attack_type = "MELEE";
								
								// get damage value
								hero_max_damage = global_arr_players[curr_player.index, MAX_WEAPON_DAMAGE];
								
								// MAGIC ATTACK -- SCALE MAGIC DAMAGE BASED ON MEELE DAMAGE
								if (magic_menu_state == USING_SPELL)
								{
									curr_spell = ds_list_find_value(ds_spellbook, magic_selected_spell); // heal 10 fire 11 stun 12 corr 13
									
									if (curr_spell == HAS_SPELL_HEAL)
									{
										hero_max_damage = -hero_max_damage * 3;
										attack_type = "HEAL"
									}
									if (curr_spell == HAS_SPELL_FIREBALL)
									{
										hero_max_damage = hero_max_damage * 8;
										attack_type = "FIREBALL"
									}
									if (curr_spell == HAS_SPELL_STUN)
									{
										hero_max_damage = hero_max_damage/3;
										attack_type = "STUN"
									}
									if (curr_spell == HAS_SPELL_CORRUPT)
									{
										hero_max_damage = 5;
										attack_type = "CORRUPT"
									}
								}
								
								// CALCULATE FINAL DAMAGE - IF MELEE THEN THERES NO SCALING
								hero_final_damage = irandom_range(round(hero_max_damage/3), hero_max_damage);
								
								if (curr_player.class == "ARCHER")
								{
									attack_type = "RANGE"
								}
								
								// SCRIP WILL HANDLE DAMAGE AND DAMAGE VISUALS
								ScriptApplyDamage(hero_final_damage, selected_target, attack_type);
								
								// AREA OF EFFECT SPELL
								if(curr_spell == HAS_SPELL_FIREBALL and selected_target.entity_type == "NPC")
								{
									for (var i=0 ; i<MAX_NPC_GROUP_SIZE ; i++)
									{
										var aoe = ds_list_find_value(ds_npcs, i); // ds_npcs holds all alive npcs
										if (aoe != undefined and aoe != selected_target and not aoe.is_dead)
										{
											ScriptApplyDamage(round(hero_final_damage/3),ds_list_find_value(ds_npcs, i), attack_type);
										}
									}
								}
								if(curr_spell == HAS_SPELL_FIREBALL and selected_target.entity_type == "PLAYER")
								{
									
									for (var i=0 ; i<MAX_HERO_GROUP_SIZE ; i++)
									{
										var aoe = ds_list_find_value(ds_selectable_player, i); 
										if (aoe != undefined and aoe != selected_target and not aoe.is_dead)
										{
											ScriptApplyDamage(round(hero_final_damage/3),ds_list_find_value(ds_selectable_player, i), attack_type);
										}
									}
								}

								// give player obj command
								curr_player.is_attacking = true;
								
								// reset MENUS for next player
								menu_option_state = DECIDING;
								magic_menu_state = CHOOSING_SPELL;
								selected_target = noone;
							}
						}
						
						// DEFEND SELECTED
						if(menu_option_index == 1)
						{
							// If not defending yet
							if(menu_option_state != DEFEND)
							{
								with(objPlayer)
								{
									if (index == other.selected_player) 
									{
										is_defending = true;
										break;
									}
								}
								// select an hero
								curr_player = ds_list_find_value(ds_players, 0);
								ds_list_delete(ds_players, 0);
								
								selected_player++;
								
								menu_option_state = DECIDING;
								menu_option_index = 0;
							}
						}
						
						// SPELL SELECTED
						if (menu_option_index == 2)
						{
							// If not using spell yet
							if (menu_option_state != SPELL)
							{	
								// Clean up old list
								if (ds_exists(ds_spellbook, ds_type_list))
								{
									ds_list_destroy(ds_spellbook);
									ds_spellbook = -1;
								}
								
								// get default target for spell
								with(objNPC_Enemy)
								{
									if (index >= 0) // if theres atleast 1 entity
									{
										other.selected_target = id;
										break;
									}
								}
								
								// Create curr player spellbook
								ds_spellbook = ds_list_create();

								// Add spells - if i had more spells id prolly make a for loop but meh
								if (global_arr_players[ds_list_find_value(ds_players, 0).index, HAS_SPELL_HEAL ])
								{
									ds_list_add(ds_spellbook, HAS_SPELL_HEAL);
									
									// get default target for spell HEAL
									with(objPlayer)
									{
										if (index >= 0) // if theres atleast 1 entity
										{
											other.selected_target = id;
											break;
										}
									}
								}
								if (global_arr_players[ds_list_find_value(ds_players, 0).index, HAS_SPELL_FIREBALL])
								{
									ds_list_add(ds_spellbook, HAS_SPELL_FIREBALL);
								}
								if (global_arr_players[ds_list_find_value(ds_players, 0).index, HAS_SPELL_STUN])
								{
									ds_list_add(ds_spellbook, HAS_SPELL_STUN);
								}
								if (global_arr_players[ds_list_find_value(ds_players, 0).index, HAS_SPELL_CORRUPT])
								{
									ds_list_add(ds_spellbook, HAS_SPELL_CORRUPT);
								}
								
								// SPELLBOOK READY
								magic_selected_spell = 0;
								curr_target = 0;
								magic_menu_state = CHOOSING_SPELL;
								
								// ALLOW TO SHOW/ITERATE SPELLBOOK
								menu_option_state = SPELL;
							}
							else
							{	// MENU IS STILL SPELL HERE
								// Reset previous attacked
								curr_target = 0;
								
								// if theres spells in curr player spellbook, select one and attack someone
								if (ds_list_size(ds_spellbook) > 0)
								{
									// this var lets ATTACK menu logic decide whether to attack with meele or spell
									magic_menu_state = USING_SPELL;
									
									// CHANGE menu_option_state FROM SPELL TO ATTACK
									menu_option_state = ATTACK; // ATTACK == TARGETTING in the following menu ;
									menu_option_index = 0;
								}
								// otherwise no spells, go back to main menu
								else 
								{
									menu_option_state = DECIDING;
									selected_target = noone;
								}
							}
						}
						
						// INVENTORY SELECTED
						if (menu_option_index == 3)
						{
							// display items
							if (menu_option_state != INV and menu_option_state != SELECT_ITEM_TARGET)
							{	
								menu_option_state = INV;
								inv_selected_item = 0;
							}
							else
							{	// choose item
								if (menu_option_state == INV)
								{
									// if item slot not empty
									if (global_arr_inv[ds_list_find_value(ds_players, 0).index, inv_selected_item] != "")
									{
										// get default target for item
										with(objPlayer)
										{
											if (not is_dead)//(index == other.selected_player) 
											{
												other.selected_target = id;
												other.curr_target = other.selected_player;
												break;
											}
										}
										
										menu_option_state = SELECT_ITEM_TARGET;
									}
									// else item slot is empty
								}
								// use item
								else 
								{
									if (menu_option_state == SELECT_ITEM_TARGET)
									{
										// select an hero
										curr_player = ds_list_find_value(ds_players, 0);
										ds_list_delete(ds_players, 0);
										
										// USE ITEM TODO make use item script
										if (global_arr_inv[curr_player.index, inv_selected_item][item_stats.item_name] == global.item_arr[items.pot_hp_pot, item_stats.item_name])
										{
											ScriptApplyDamage(-global.item_arr[items.pot_hp_pot, item_stats.item_str], selected_target, "HEAL");
										}
										if (global_arr_inv[curr_player.index, inv_selected_item][item_stats.item_name] == global.item_arr[items.pot_elixir, item_stats.item_name])
										{
											ScriptApplyDamage(-global.item_arr[items.pot_hp_pot, item_stats.item_str], selected_target, "HEAL");
										}
										if (global_arr_inv[curr_player.index, inv_selected_item][item_stats.item_name] == global.item_arr[items.pot_ap_pot, item_stats.item_name])
										{
											ScriptApplyDamage(global.item_arr[items.pot_ap_pot, item_stats.item_str], selected_target, "HEAL");
										}
										
										// give player obj command
										// TODO change to animation use item maybe?
								
										// REMOVE ITEM FROM IVENTORY
										global_arr_inv[curr_player.index, inv_selected_item] = "";
										
										// for player pointer that tells which player is curr attacking
										selected_player++;
								
										// reset MENUS for next player
										menu_state = DECISION_MENU;
										menu_option_state = DECIDING;
										menu_option_index = 0;
										selected_target = noone;
										curr_target = 0;

									}
								}
							}
						}
						
						// RUN AWAY SELECTED
						if (menu_option_index == 4)
						{
							// 50 50 % chance 
							run_chance = choose("RUN","FAIL");
							if (run_chance == "RUN")
							{
								// GTFO
								state = BATTLE_END;
								result = "RUN";
								end_text = "You manage to run away...";
							}
							else
							{
								// SKIP TURN
								ds_list_delete(ds_players, 0);
								selected_player++;
								
								// RESET MENUS
								menu_state = DECISION_MENU;
								menu_option_state = DECIDING;
								menu_option_index = 0;
							}
						}
					}
					#endregion
					
					
					// CHOOSE A TARGET - ITERATION BETWEEN ENTITIES ON THE BATTLEFIELD
					if (menu_option_state == ATTACK or menu_option_state ==  SELECT_ITEM_TARGET)
					{
						// SELECT TARGET TO ATTACK
					
						// IF SELECTING AN NPC
						if (selected_target.entity_type == "NPC")
						{
							// BUG FIX	 //  probably a bad bug fix but this solves the issue of killing default selected npc and next player being  able to still attack it 
							selected_target = ds_selectable_npc[| curr_target]; // if selection isnt changed. This forces the next selection to not be that NPC
							// BUG FIX												  //  this does not feel like an optimal fix. TO_DO
							
							// left right keys switch between selecting a hero and an npc target
							if (keyboard_check_pressed(LEFT_KEY) or keyboard_check_pressed(RIGHT_KEY))
							{
								curr_target = 0;
								selected_target = ds_selectable_player[| curr_target]; // | is an accessor gets first entry of a list
							}
							
							// ITERATE TRHOUGH POSSIBLE NPC TARGETS
							if (keyboard_check_pressed(DOWN_KEY))
							{
								if (curr_target+1 < ds_list_size(ds_selectable_npc))
								{
									curr_target++;
								}
								else
								{
									curr_target = 0;
								}
								selected_target = ds_selectable_npc[| curr_target];
							}
							if (keyboard_check_pressed(UP_KEY))
							{
								if (curr_target-1 >= 0)
								{
									curr_target--;
								}
								else
								{
									curr_target = ds_list_size(ds_selectable_npc)-1;
								}
								selected_target = ds_selectable_npc[| curr_target];
							}
						}
						else
						{	// IF SELECTING A PLAYER CHARACTER
							if (selected_target.entity_type == "PLAYER")
							{	
								// left right keys switch between selecting a hero and an npc target
								if (keyboard_check_pressed(LEFT_KEY) or keyboard_check_pressed(RIGHT_KEY))
								{
									curr_target = 0;
									selected_target = ds_selectable_npc[| curr_target]; // | is an accesser gets first entry of a list
								}
								
								// ITERATE TRHOUGH POSSIBLE PLAYER TARGETS
								if (keyboard_check_pressed(DOWN_KEY))
								{
									if (curr_target+1 < ds_list_size(ds_selectable_player))
									{
										curr_target++;
									}
									else
									{
										curr_target = 0;
									}
									selected_target = ds_selectable_player[| curr_target];
								}
								if (keyboard_check_pressed(UP_KEY))
								{
									if (curr_target-1 >= 0)
									{
										curr_target--;
									}
									else
									{
										curr_target = ds_list_size(ds_selectable_player)-1;
									}
									selected_target = ds_selectable_player[| curr_target];
								}
								
							}
						}
					}
					
					// SPELL ITERATION - ITERATION BETWEEN SPELLS
					if (menu_option_state == SPELL)
					{
						magic_known_spells = ds_list_size(ds_spellbook) -1;
						
						// ITERATE TRHOUGH SPELLBOOK
						if (keyboard_check_pressed(DOWN_KEY))
						{
							if (magic_selected_spell == magic_known_spells)
							{
								magic_selected_spell = 0;
							}
							else
							{
								magic_selected_spell++;
							}
						}
						if (keyboard_check_pressed(UP_KEY))
						{
							if (magic_selected_spell == 0)
							{
								magic_selected_spell = magic_known_spells;
							}
							else
							{
								magic_selected_spell--;
							}
						}
					}
					
					// INV ITERATION
					if (menu_option_state == INV)
					{
						// ITERATE TRHOUGH INVENOTRY
						if (keyboard_check_pressed(DOWN_KEY))
						{
							if (inv_selected_item == INVENTORY_SIZE-1)
							{
								inv_selected_item = 0;
							}
							else
							{
								inv_selected_item++;
							}
						}
						if (keyboard_check_pressed(UP_KEY))
						{
							if (inv_selected_item == 0)
							{
								inv_selected_item = INVENTORY_SIZE-1;
							}
							else
							{
								inv_selected_item--;
							}
						}
					}
				}
			}
			
			// GO BACK TO MAIN MENU - QUIT CURRENT MENU SELECTION
			if (keyboard_check_pressed(QUIT_KEY))
			{
				menu_option_state = DECIDING;
				//RESET MAGIC MENU
				magic_menu_state = CHOOSING_SPELL;
			}
			
			// once list is empty, restart
			if (ds_list_size(ds_players) <= 0)
			{
				turn_status = STAND_BY; 
			}
		}
		#endregion
		
		// NPC TURN
		#region NPC_TURN
		if (not player_turn) 
		{
			// CLEAN UP NPC LIST
			if (turn_status == INIT)
			{
				if (ds_exists(ds_npcs, ds_type_list))
				{
					ds_list_destroy(ds_npcs);
					ds_npcs = -1;
				}
				ds_npcs = ds_list_create();
		
				// update npc list
				with (objNPC_Enemy)
				{
					// if npc HP is more than zero then add to fighters
					if (npc_curr_hp > 0)
					{
						ds_list_add(other.ds_npcs, id);
					}
					// increment stun status
					if (is_stunned > 0)
					{
						is_stunned--;
					}
					// reset def status
					is_defending = false;
				}
				
				// CLEAN UP PLAYER LIST
				if (ds_exists(ds_players, ds_type_list))
				{
					ds_list_destroy(ds_players);
					ds_players = -1;
				}
				ds_players = ds_list_create();
		
				// update hero list
				with (objPlayer)
				{
					// if hero HP is more than zero then add to fighters
					if (global_arr_players[index, CURR_HP] > 0) 
					{
						ds_list_add(other.ds_players, id);
					}
				}
				
				turn_status = READY;
			}
			
			// select an npc and remove it from list
			if (turn_status == READY)
			{
				attack_timer++;
				if (attack_timer >= ATTACK_COOLDOWN)
				{
					// select npc at curr turn
					selected_npc = ds_list_find_value(ds_npcs, 0);
					ds_list_delete(ds_npcs, 0);
					
					if (selected_npc.is_stunned > 0)
					{
						selected_npc.is_stunned--;
					}
					
					if (selected_npc.is_corrupted)
					{
						ScriptApplyDamage(selected_npc.corruption, selected_npc, "CORRUPT");
					}
					
					// IF NOT STUNNED
					if (selected_npc.is_stunned <= 0)
					{
						// NPC ACTION COMMAND
						selected_npc.is_attacking = true;
						
						#region NPC COMBAT AI
						// NPC AI
						var has_done_action = false;
						
						// SIMULATE HEAL SELF WITH ITEM 
						if (selected_npc.npc_curr_hp < selected_npc.npc_max_hp/4 and selected_npc.has_healed < 2)
						{
							chance_npc_heals_itself = 5;
							roll = irandom(99);
							if (chance_npc_heals_itself > roll)
							{
								has_done_action = true;
								selected_npc.has_healed++;
								ScriptApplyDamage(-round(selected_npc.npc_max_hp*0.1), selected_npc, "HEAL");
							}
						}
						// TARGET SOMETHING
						else
						{
							npc_final_damage = irandom_range(round(selected_npc.npc_damage/3), selected_npc.npc_damage);
							
							// HEALER CLASS AI
							if (selected_npc.class == "HEALER" and not has_done_action)
							{
								// OPTION - HEAL ITSELF
								if (selected_npc.npc_curr_hp < selected_npc.npc_max_hp/3 and not has_done_action)
								{
									chance_npc_heals_itself = 30;
									roll = irandom(99);
									if (chance_npc_heals_itself > roll)
									{
										has_done_action = true;
										ScriptApplyDamage(-npc_final_damage, selected_npc, "HEAL");
									}
								}
								
								// OPTION - HEAL OTHER
								if (not has_done_action)
								{
									chance_npc_heals_someone = 60;
									roll = irandom(99);
									if (chance_npc_heals_someone > roll)
									{
										curr_lowest_hp = 99999;
										heal_target = noone;
										for (var i=0 ; i<MAX_NPC_GROUP_SIZE ; i++)
										{
											var possible_heal_target = ds_list_find_value(ds_npcs, i); // ds_npcs holds all alive npcs
											if (possible_heal_target != undefined and possible_heal_target != selected_npc)
											{
												var hp_temp = (possible_heal_target.npc_curr_hp * 100)/possible_heal_target.npc_max_hp
												if (hp_temp < curr_lowest_hp)
												{
													curr_lowest_hp = hp_temp;
													heal_target = possible_heal_target;
												}
											}
										}	
										if (heal_target != noone)
										{
											has_done_action = true;
											ScriptApplyDamage(-npc_final_damage, heal_target, "HEAL");
										}
									}
								}
								// debuff healer offensive damage
								npc_final_damage = round(npc_final_damage/3);
							} // HEALER AI END
							
							// OPTION - DEFEND
							if (not has_done_action)
							{
								chance_npc_defends = 15;
								roll = irandom(99);
								if (chance_npc_defends > roll)
								{
									has_done_action = true;
									selected_npc.is_defending = true;
								}
							}
							
							// OPTION - ATTACK
							if (not has_done_action)
							{
								// SELECT PLAYER TARGET
								npc_player_target = ds_players[| irandom(ds_list_size(ds_players)-1)];
													
								// CHOOSE STANDARD ATTACK
								// IF MAGE CLASS
								if (selected_npc.class == "MAGE")
								{
									// CHOOSE STUN
									chance_npc_uses_stun = 10;
									roll = irandom(99);
									if (chance_npc_uses_stun > roll)
									{
										has_done_action = true;
										ScriptApplyDamage(round(npc_final_damage/3), npc_player_target, "STUN");
									}
									// CHOOSE CORRUPT
									if (not has_done_action)
									{
										chance_npc_uses_corrupt = 20;
										roll = irandom(99);
										if (chance_npc_uses_corrupt > roll)
										{
											has_done_action = true;
											ScriptApplyDamage(round(npc_final_damage/6), npc_player_target, "CORRUPT");
										}
									}
									// CHOOSE FIREBALL
									if (not has_done_action)
									{
										ScriptApplyDamage(npc_final_damage, npc_player_target, "FIREBALL");
										for (var i=0 ; i<MAX_HERO_GROUP_SIZE ; i++)
										{
											var aoe = ds_list_find_value(ds_players, i); 
											if (aoe != undefined and aoe != npc_player_target)
											{
												ScriptApplyDamage(round(npc_final_damage/3),ds_list_find_value(ds_players, i), "FIREBALL");
											}
										}
									}
								}
								
								// ELSE IF WEAPON USER
								else 
								{
									if (selected_npc.class == "ARCHER")
									{
										ScriptApplyDamage(npc_final_damage, npc_player_target, "RANGE");
									}
									else 
									{
										ScriptApplyDamage(npc_final_damage, npc_player_target, "MEELE");
									}
									has_done_action = true;
								}
							}
						}
					}
					#endregion
					// RESET
					attack_timer = 0;
				}
				
				// once list is empty, restart
				if (ds_list_size(ds_npcs) <= 0)
				{
					switch_turns_timer++;
					if (switch_turns_timer >= ATTACK_COOLDOWN)
					{
						switch_turns_timer = 0;
						turn_status = INIT;
						player_turn = true;
					}
				}
			}
		}
		#endregion
		
	break;
}

// NOT TESTED
if (turn_status == STAND_BY)
{
	turn_timer++;
	if (turn_timer >= 50)
	{
		turn_status = INIT;
		player_turn = false;
		selected_player = 0;
	}
}	

// RAN AWAY / NPC DIED / PLAYER DIED
// HANDLE BATTLE END!
if (state == BATTLE_END)
{
	// avoid case of player spam clicking space
	end_timer++
	// if press continue
	if (keyboard_check_pressed(CONTINUE_KEY) and end_timer > room_speed*3)
	{
		if (result == "WIN" or result == "RUN")
		{
			// make all spawners in room visible
			with(objBattleSpawner)
			{
				if (room = global.player_prev_room)
				{
					visible = true;
				}
			}
			if (result == "WIN")
			{
				// disable the active spawner
				global.curr_active_battle_spawn.state = REMOVE;
				
				// player rewards
				ScriptRewardBattle();
			}
			if (result == "RUN")
			{
				global.player_x_before_battle = global.player_warp_to_x;
				global.player_y_before_battle = global.player_warp_to_y;
			}
			// Clean old objects
			with (objPlayer)
			{
				instance_destroy();
			}
			with (objNPC_Enemy)
			{
				instance_destroy();
			}
			instance_destroy();
		
			// go back to previous room
			global.warp_destination = global.player_prev_room;
			room_goto(global.player_prev_room);
		}
		else
		{
			global.gameover_menu_state = true;
		}
	}
}
	
}
	
	
	




