
function ScriptCallTrade(target)
{
	if (target.can_trade)
	{
		if (target.is_shop)
		{
			//TODO
		}
		else
		{
			text_arr = "Hmm.../Well, I have a " + target.trade_items[0] + " i can sell you for " + string(target.trade_items[1]) + " coins./";
			text_arr = ScriptTextParser(text_arr);
		
			ScriptGenericMenu(M_TEXT, text_arr, target.npc_name, false, 0);

			ScriptGenericMenu(M_OPTIONS, [
			["Yes.", ScriptCallTradeAccepted, target], // TODO TRADE 
			["No.", ScriptCallTradeDeclined, target]], // reminder - last option is always an exit function
			"Accept " + target.npc_name + "'s offer?", false, 1);
			

		}
	}
	else
	{
		text_arr =  "Ah.../Sorry.../I have nothing to trade right now.../";
		text_arr = ScriptTextParser(text_arr);
		
		ScriptGenericMenu(M_TEXT, text_arr, target.npc_name, true, 0);
	}
}


