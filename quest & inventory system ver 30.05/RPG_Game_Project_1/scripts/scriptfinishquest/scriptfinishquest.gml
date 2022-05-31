
function ScriptFinishQuest(target_npc)
{
	// check if npc gave quest and quest is finished b4 any other interactions
	if (global.active_quest.quest_giver_x == target_npc.x and global.active_quest.quest_giver_y == target_npc.y)
	{
		// If this is the npc that gave you the quest and quest is finished 
		if (global.active_quest.state == COMPLETED)
		{
			text_arr = "You deserve nothing so you get nothing./";
			text_arr = ScriptTextParser(text_arr);
			ScriptGenericMenu(M_TEXT, text_arr, "Quest Reward:", true, 0);
			global.active_quest.state = REMOVE;
			global.active_quest = noone;
			
			return "quest_npc";
			
			// TODO QUEST REWARD
			
		}
		// else gtfo
		else
		{
			text_arr = "I'm busy right now./Why don't you go finish that quest I gave you?/";
			text_arr = ScriptTextParser(text_arr);
			ScriptGenericMenu(M_TEXT, text_arr, target_npc.npc_name, true, 0);
			
			return "quest_npc";
		}
	}
	else 
	{
		// check if npc needed to be found for a quest
		if (global.active_quest.state == READY and target_npc.npc_name == global.active_quest.npc_to_find_name)
		{
			global.active_quest.npc_was_found = true;
			
			// TODO unique quest dialog
			text_arr = "Hello there!/Were you looking for an Inn to stay at?/Welcome, welcome!/";
			text_arr = ScriptTextParser(text_arr);
			ScriptGenericMenu(M_TEXT, text_arr, target_npc.npc_name, true, 0);
			
			return "quest_npc";
		}
	}
}