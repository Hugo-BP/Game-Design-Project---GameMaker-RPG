
function ScriptApplyDamage(final_damage, target, attack_type)
{
	if (target.is_defending)
	{
		final_damage = round(final_damage/2);
	}
	
	// Check if target is a PLAYER or ENEMY_NPC
	if (target.entity_type == "NPC")
	{
		// target is NPC
		
		// check if overhealed
		if (attack_type == "HEAL" and target.npc_curr_hp-final_damage > target.npc_max_hp)
		{
			var overheal = (target.npc_curr_hp - final_damage) mod target.npc_max_hp;
			final_damage += overheal;
		}
		
		// deduct damage from intanced NPC hp since this data is useless after combat is done
		target.npc_curr_hp -= final_damage;
		
		if (attack_type == "RANGE")
		{	audio_play_sound(snd_range,2,false);
			target.npc_curr_hp -= final_damage;
			damage2 = instance_create_depth(target.x + sprite_get_width(target.sprite_index)/2 -8, target.y +5 - sprite_get_width(target.sprite_index)/2, -200, objDamageVisuals);
			damage2.colour = c_gray;
			damage2.text = final_damage;
		}
		
		// check if dead
		if (target.npc_curr_hp <= 0)
		{
			// if target is dead, then reduce npc party by 1
			target.index--; 
			
			list_index = ds_list_find_index(ds_selectable_npc, target);
			ds_list_delete(ds_selectable_npc, list_index);

			
			target.npc_curr_hp = 0;
			target.is_dead = true;
			target.is_corrupted = false;
			
			// check if all dead
			
			if ( ds_list_size(ds_selectable_npc) == 0)
			{
				objBattleManager.state = BATTLE_END;
				objBattleManager.result = "WIN";
				objBattleManager.end_text = "VICTORY!";
			}			
		}
		
		if (attack_type == "HEAL")
		{
			target.corruption = 0;
			target.is_corrupted = false;
		}
		if (attack_type == "CORRUPT")
		{
			target.corruption = final_damage+1;
			target.is_corrupted = true;
		}
		
		if (attack_type == "STUN")
		{
			stun_chance = 65;
			roll = irandom(99);
			if (stun_chance > roll)
			{
				target.is_stunned = 3;
			}
		}
	}
	else
	{
		// target is PLAYER
		
		// check if overhealed
		if (attack_type == "HEAL" and global_arr_players[target.index, CURR_HP]-final_damage > global_arr_players[target.index, MAX_HP])
		{
			var overheal = (global_arr_players[target.index, CURR_HP] - final_damage) mod global_arr_players[target.index, MAX_HP];
			final_damage += overheal;
		}
		
		// deduct damage directly to hp value saved within persistent data storage
		global_arr_players[target.index, CURR_HP] -= final_damage;
		
		if (attack_type == "RANGE")
		{	audio_play_sound(snd_range,2,false);
			global_arr_players[target.index, CURR_HP] -= final_damage;
			damage2 = instance_create_depth(target.x + sprite_get_width(target.sprite_index)/2 -8, target.y +5 - sprite_get_width(target.sprite_index)/2, -200, objDamageVisuals);
			damage2.colour = c_gray;
			damage2.text = final_damage;
		}
		
		// check if dead
		if (global_arr_players[target.index, CURR_HP] <= 0)
		{
			list_index = ds_list_find_index(ds_selectable_player, target);
			ds_list_delete(ds_selectable_player, list_index);
			
			global_arr_players[target.index, CURR_HP] = 0;
			target.is_dead = true;
			target.is_corrupted = false;
			
			if ( ds_list_size(ds_selectable_player) == 0)
			{
				objBattleManager.state = BATTLE_END;
				objBattleManager.result = "LOSE";
				objBattleManager.end_text = "DEFEAT!";
				global.gameover = true;
				with (objPlayer)
				{
					anim_idle = sprDead;
				}
			}
		}
		
		if (attack_type == "HEAL")
		{
			target.corruption = 0;
			target.is_corrupted = false;
		}
		if (attack_type == "CORRUPT")
		{
			target.corruption = final_damage+1;
			target.is_corrupted = true;
		}
		if (attack_type == "STUN")
		{
			stun_chance = 65;
			roll = irandom(99);
			if (stun_chance > roll)
			{
				target.is_stunned = 3;
			}
		}
	}
	
	damage = instance_create_depth(target.x + sprite_get_width(target.sprite_index)/2, target.y - sprite_get_width(target.sprite_index)/2, -200, objDamageVisuals);
	
	damage.colour = c_gray;
	damage.text = final_damage;
	if (attack_type == "HEAL")
	{audio_play_sound(snd_heal,2,false);
		damage.colour = c_green;
		damage.text = -final_damage;
	}
	if (attack_type == "FIREBALL")
	{	audio_play_sound(snd_fire_attack,2,false);
		damage.colour = c_red;
	}
	if (attack_type == "STUN")
	{
		damage.colour = c_blue;
	}
	if (attack_type == "CORRUPT")
	{
		damage.colour = c_purple;
	}
	if (attack_type == "MELEE")
	{
		audio_play_sound(snd_attack_sword,2,false);
	}
	
	// END OF SCRIPT
}