if (state == INIT)  {

	objPlayer.is_busy = true;
    objPlayer.movement_disabled = true;
	state = READY;
	
//text_arr = "Wowww? Where am i? where is my family? oh no, i'm lost in the Blisterwood./My fathers always told me that playing near this place was very dangerous! why didn't I pay attention to them?/ I need to go back to home, but how?.../ I'm feeling very weak and hungry too. I need to find something to eat fast.../"
text_arr = ScriptTextParser(text_arr);	
ScriptGenericMenu(M_TEXT, text_arr, title_arr,true, 0);

}


