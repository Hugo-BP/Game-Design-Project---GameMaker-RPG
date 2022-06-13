		
		if (state == INIT) {
		text_to_use = "Congratulations, you are a true king /";
		
		text_arr = ScriptTextParser(text_to_use);
	
		ScriptGenericMenu(M_TEXT, text_arr, "Congratulations", true, 0);
		state = READY;
		}  /// @description Insert description here
// You can write your code in this editor
