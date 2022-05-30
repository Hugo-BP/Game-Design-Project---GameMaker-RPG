
function ScriptCallTradeAccepted(target)
{
	if (global.purse < target.trade_items[1])
	{
		text_arr =  "I don't have enough gold in my purse to afford that./";
		text_arr = ScriptTextParser(text_arr);
	}
	else
	{
		text_arr =  "Sure. Sounds like a good deal./";
		text_arr = ScriptTextParser(text_arr);
	}
	ScriptGenericMenu(M_TEXT, text_arr, objPlayer.name, true, 0);
}