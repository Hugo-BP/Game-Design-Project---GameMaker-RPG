
function ScriptCallQuest(target)
{
	if (target.can_give_quest)
	{
		// if no active quest yet
		if (global.active_quest == noone)
		{
			target.can_give_quest = false;
			text_arr = "A quest?/Hmm... How about.../";
		
			// Create quest instance
			quest = instance_create_layer(target.x, target.y, "Instance_Other", objActiveQuest);
			quest.quest_type = choose("kill", "find");
			if (global.first_quest)
			{
				quest.quest_type = "find";
			}
			quest.quest_giver_x = target.x; 
			quest.quest_giver_y = target.y; 
		
			// Define what to do in the quest
			// KILL NPC QUEST
			if (quest.quest_type == "kill")
			{
				// choose random type and number of NPC
				enemy = choose("", enemies.skeleton_knight, enemies.skeleton_archer, enemies.demon, enemies.evil_eye);
				nr = irandom_range(3, 7);
				// if type of npc doesnt matter then kill x monsters
				if (enemy == "")
				{
					text_arr += "You kill " + string(nr) + " monsters./";
					quest.npc_to_kill_name = "";
				}
				// else kill x of specific type of monster
				else
				{
					 text_arr += "You kill " + string(nr) + " " + global_arr_enemies[enemy][NAME] + "./";
					 quest.npc_to_kill_name = global_arr_enemies[enemy][NAME];
				}
				// set number of npcs to kill
				quest.npc_to_kill_nr = nr;
			}
			
			// FIND NPC QUEST
			if (quest.quest_type == "find")
			{
				// find this type of NPC
				find = friendlies.inn_keeper;
				text_arr += "You go find an Inn Keeper./It's always good to know where there's a place you can stay for the night./";
				quest.npc_to_find_name = global_arr_friendlies[find][NAME];
			}
			
			// Quest is set up
			quest.state = INIT;
			// set active quest as current quest
			global.active_quest = quest;
			// NPC text saying what the quest is
			text_arr = ScriptTextParser(text_arr);
			ScriptGenericMenu(M_TEXT, text_arr, target.npc_name, true, 0);
		}
		// else come back later
		else
		{
			text_arr = "Eh?/ You already have a quest./Go finish that one first./";
			text_arr = ScriptTextParser(text_arr);
			ScriptGenericMenu(M_TEXT, text_arr, target.npc_name, true, 0);
		}
	}
	// else no quests from this npc
	else
	{
		text_arr =  "Ah.../Maybe look in the Guild!/They're always looking for people who can kill monsters./I've even seen some goblins far away.../You'd be a good helping hand!/Good luck!/";
		text_arr = ScriptTextParser(text_arr);
		
		ScriptGenericMenu(M_TEXT, text_arr, target.npc_name, false, 0);
		
		text_arr =  "Thanks. I'll be on my way then./";
		text_arr = ScriptTextParser(text_arr);
		
		ScriptGenericMenu(M_TEXT, text_arr, objPlayer.name, true, 1);
		
	}
}


