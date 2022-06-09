
function ScriptCallQuest(target)
{
	if (target.can_give_quest)
	{
		// TODO
	}
	else
	{
		text_arr =  "Ah.../So you're an adventurer?/Maybe look in the Guild!/They're always looking for people who can kill monsters./I've even seen some goblins far away.../You'd be a good helping hand!/Good luck!/";
		text_arr = ScriptTextParser(text_arr);
		
		ScriptGenericMenu(M_TEXT, text_arr, target.npc_name, false, 0);
		
		text_arr =  "Thanks. I'll be on my way then./";
		text_arr = ScriptTextParser(text_arr);
		
		ScriptGenericMenu(M_TEXT, text_arr, objPlayer.name, true, 1);
		
	}
}


