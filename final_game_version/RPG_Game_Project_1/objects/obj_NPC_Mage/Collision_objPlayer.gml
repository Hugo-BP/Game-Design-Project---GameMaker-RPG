// this is just used for the solid object status

if (state == INIT)  {

	objPlayer.is_busy = true;
    objPlayer.movement_disabled = true;
	
	if(global.recruit_archer and not global.recruit_mage){
	state = READY;
	
//text_arr = "Wowww? Where am i? where is my family? oh no, i'm lost in the Blisterwood./My fathers always told me that playing near this place was very dangerous! why didn't I pay attention to them?/ I need to go back to home, but how?.../ I'm feeling very weak and hungry too. I need to find something to eat fast.../"
text_arr = ScriptTextParser(text_arr);	
ScriptGenericMenu(M_TEXT, text_arr, title_arr,false, 0);

text_arr1 = ScriptTextParser(text_arr1);	
ScriptGenericMenu(M_TEXT, text_arr1,title_arr,false, 1);

text_arr2 = ScriptTextParser(text_arr2);	
ScriptGenericMenu(M_TEXT, text_arr2,title_arr,false, 2);

text_arr3 = ScriptTextParser(text_arr3);	
ScriptGenericMenu(M_TEXT, text_arr3,title_arr,false, 3);

text_arr4 = ScriptTextParser(text_arr4);	
ScriptGenericMenu(M_TEXT, text_arr4,title_arr,true, 4);

	}else{
		
	text_arr0 ="im busy right now !/";

	text_arr0 = ScriptTextParser(text_arr0);	
	ScriptGenericMenu(M_TEXT, text_arr0,title_arr,true, 0);
	
	}
}

