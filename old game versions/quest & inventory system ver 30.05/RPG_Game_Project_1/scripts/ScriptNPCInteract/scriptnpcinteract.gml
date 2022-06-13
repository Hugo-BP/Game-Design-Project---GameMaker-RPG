
function ScriptNPCInteract()
{
	// distance between player and npc at which interactions are allowed 
	// player needs to face npc too
	activate_distance = TILESIZE/3;
	var is_interacting = false;

	var dir_x = lengthdir_x(activate_distance, direction);
	var dir_y = lengthdir_y(activate_distance, direction);
	
	var target_npc = instance_place(x + dir_x, y + dir_y, objNPC_Friendly);
	
	// if you found an NPC
	if (target_npc != noone)
	{
		// start interaction
		is_busy = true;
		movement_disabled = true;
		is_interacting = true;
	}
	
	if (is_interacting)
	{
		var stat = "";
		if (global.active_quest != noone)
		{
			// check if npc is involved in quests
			stat = ScriptFinishQuest(target_npc);
		}
		
		// if npc is a quest npc then skip the interact menu on the first attempt at interaction
		if (stat != "quest_npc") 
		{
			if (not target_npc.is_shop)
			{
				ScriptGenericMenu(M_OPTIONS, [
				["Chat with " + target_npc.npc_name + ".", ScriptCallText, target_npc],
				["Trade with " + target_npc.npc_name + ".", ScriptCallTrade, target_npc],
				["Ask " + target_npc.npc_name + " for a Quest.", ScriptCallQuest, target_npc],
				["Use item on " + target_npc.npc_name + ".", ScriptCallItem, target_npc],
				["Leave.", -1]], 
				"You look at the " + target_npc.npc_name + "...", true, 0); 
				// scripts are only called after the option is selected so start these scripts as 0
			}
			if (target_npc.is_shop)
			{
				ScriptGenericMenu(M_OPTIONS, [
					["Chat with " + target_npc.npc_name + ".", ScriptCallText, target_npc],
					["Trade with " + target_npc.npc_name + ".", ScriptCallTrade, target_npc],
					["Leave.", -1]], 
					"You look at the " + target_npc.npc_name + "...", true, 0); 
			}
			if (target_npc.can_recruit)
			{
				ScriptRecruitHero(target_npc);
			}
		}
		
		return true;
	}
	
	return false;
}