
function ScriptCallTrade(target)
{
	if (target.can_trade)
	{
		// if npc runs a store
		if (target.is_shop)
		{
			// if its the inn keeper, she only sells one thing
			if (target.class == "Inn Keeper" )
			{
				ScriptGenericMenu(M_OPTIONS, [
				["Yes.", ScriptCallTradeAccepted, target], // TODO TRADE 
				["No.", ScriptCallTradeDeclined, target]], // reminder - last option is always an exit function
				"Rent a room for the night, for " + string(target.trade_items[1]) + " coins?", false, 0);
			}
			else // else open shop interface
			{
				ScriptOpenShopInterface(target);
			}
		}
		// if its a random npc selling a random item
		else
		{
			text_arr = "Well, I have a " + target.trade_items[0] + " i can sell you for " + string(target.trade_items[1]) + " coins./";
			text_arr = ScriptTextParser(text_arr);
		
			ScriptGenericMenu(M_TEXT, text_arr, target.npc_name, false, 0);

			ScriptGenericMenu(M_OPTIONS, [
			["Yes.", ScriptCallTradeAccepted, target], // TRADE 
			["No.", ScriptCallTradeDeclined, target]], // reminder - last option is always an exit function
			"Accept " + target.npc_name + "'s offer: " + target.trade_items[0] + " for " + string(target.trade_items[1]) + " coins?", false, 1);
		}
	}
	else
	{
		text_arr =  "Ah.../Sorry.../I have nothing to trade right now.../";
		text_arr = ScriptTextParser(text_arr);
		
		ScriptGenericMenu(M_TEXT, text_arr, target.npc_name, true, 0);
	}
}


