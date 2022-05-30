
function ScriptCallTradeAccepted(target)
{
	// trade with shop npcs
	if (target.is_shop and target.class != "Inn Keeper")
	{
		ScriptOpenShopInterface(target);
	}
	// trade with npcs for 1 item
	else
	{
		if (global.purse < target.trade_items[1])
		{
			text_arr =  "I don't have enough gold in my purse to afford that./";
			text_arr = ScriptTextParser(text_arr);
			ScriptGenericMenu(M_TEXT, text_arr, objPlayer.name, true, 0);
		}
		else
		{
			text_arr =  "Sure. Sounds like a good deal./";
			text_arr = ScriptTextParser(text_arr);
			ScriptGenericMenu(M_TEXT, text_arr, objPlayer.name, true, 0);
			
			// TODO add item to player inventory
		}
		
	}
}