show_debug_message(quest_type)
if (state == COMPLETED)
{
	ScriptGenericMenu(M_TEXT, [["You get fuckall lol."]], "Quest Reward:", true, 0);
	other.state = REMOVE;
	global.active_quest = noone;
}