
function ScriptCallText(target)
{
	// if chatting with store owner, he'll probably ask if you want to see the store 
	if (target.is_shop)
	{
		text_to_use = irandom_range(0, array_length(target.npc_text)-1);
		text_arr = ScriptTextParser(target.npc_text[text_to_use]);
	
		ScriptGenericMenu(M_TEXT, text_arr, target.npc_name, false, 0);
		
		// store
		ScriptGenericMenu(M_OPTIONS, [
			["Yes.", ScriptCallTradeAccepted, target], // TRADE 
			["No.", ScriptCallTradeDeclined, target]], // reminder - last option is always an exit function
			"Rent a room for the night, for " + string(target.trade_items[1]) + " coins?", false, 1);
	}
	// else just some npc text
	else
	{
		text_to_use = irandom_range(0, array_length(target.npc_text)-1);
		text_arr = ScriptTextParser(target.npc_text[text_to_use]);
	
		ScriptGenericMenu(M_TEXT, text_arr, target.npc_name, true, 0);
	}
}


