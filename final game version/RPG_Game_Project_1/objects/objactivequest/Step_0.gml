
if (state == INIT)
{
	text_arr = "";
	
	state = READY;
}

if (state == READY)
{
	if (npc_was_found)
	{
		is_finished = true;
		text_arr = "You found " + npc_to_find_name + ". You can go claim your reward now./";
		show_debug_message("found")
	}

 	if ( npc_to_kill_nr <= npc_killed)
	{
		show_debug_message("killed")
		is_finished = true;
		if (npc_to_kill_name != "")
		{
			text_arr = "You killed " + string(npc_killed) + " " + npc_to_kill_name + ". You can go claim your reward now./";
		}
		else
		{
			text_arr = "You killed " + string(npc_to_kill_nr) + " monsters. You can go claim your reward now./";
		}
	}
	
	if (is_finished)
	{
		text_arr = ScriptTextParser(text_arr);
		if (keyboard_check_released(CONTINUE_KEY))
		{
			ScriptGenericMenu(M_TEXT, text_arr, "Quest Complete!", true, 0);
			state = COMPLETED;
		}
	}
}



if (state == REMOVE)
{
	instance_destroy();
}