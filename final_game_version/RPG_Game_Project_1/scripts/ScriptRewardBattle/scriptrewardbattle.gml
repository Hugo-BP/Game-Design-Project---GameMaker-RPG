
function ScriptRewardBattle()
{
	// EXP
	for (var p=0 ; p < array_length(global_arr_players) ; p++)
	{
		for (var n=0 ; n < array_length(global_spawner_units) ; n++)
		{
			global_arr_players[p, EXP] += global_spawner_units[n, EXP];
			
			if (global_spawner_units[n, NAME] == "Lich")
			{
				global.finishedRoom1 = true; 
			}
		}	
	}
	// GOLD & DROPS
	global.purse += 25;
	
	// QUEST
	if (global.active_quest != noone and global.active_quest.quest_type == "kill")
	{
		for (var n=0 ; n < array_length(global_spawner_units) ; n++)
		{
			if (global.active_quest.npc_to_kill_name == "")
			{
				global.active_quest.npc_killed++;
			}
			else
			{
				if (global.active_quest.npc_to_kill_name == global_spawner_units[n, NAME])
				{
					global.active_quest.npc_killed++;
				}
			}
		}
	}
}