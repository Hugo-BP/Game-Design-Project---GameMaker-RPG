
function ScriptCallItem(target)
{
	text_arr =  "I don't have any items on me./";
	text_arr = ScriptTextParser(text_arr);

	ScriptGenericMenu(M_TEXT, text_arr, objPlayer.name, true, 0);
}
