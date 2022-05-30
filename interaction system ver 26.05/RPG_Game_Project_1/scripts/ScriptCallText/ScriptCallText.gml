
function ScriptCallText(target)
{
	text_to_use = irandom_range(0, array_length(target.npc_text)-1);
	text_arr = ScriptTextParser(target.npc_text[text_to_use]);
	
	ScriptGenericMenu(M_TEXT, text_arr, target.npc_name, true, 0);
}


