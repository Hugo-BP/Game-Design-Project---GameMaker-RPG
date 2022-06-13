
function ScriptCallTradeDeclined()
{
	text_arr =  "Thanks, but I'll pass.../";
	text_arr = ScriptTextParser(text_arr);
		
	ScriptGenericMenu(M_TEXT, text_arr, objPlayer.name, true, 0);
}