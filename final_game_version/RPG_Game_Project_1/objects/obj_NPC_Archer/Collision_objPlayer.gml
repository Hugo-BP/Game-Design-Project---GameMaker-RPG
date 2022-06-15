// this is just used for the solid object status

if (state == INIT)  {

	objPlayer.is_busy = true;
    objPlayer.movement_disabled = true;
	
if (not global.recruit_archer){
	
		state = READY;
	
text_arr6 = ScriptTextParser(text_arr6);	
ScriptGenericMenu(M_TEXT, text_arr6, title_arr,false, 0);

text_arr7 = ScriptTextParser(text_arr7);	
ScriptGenericMenu(M_TEXT, text_arr7,title_arr,false, 1);

text_arr8 = ScriptTextParser(text_arr8);	
ScriptGenericMenu(M_TEXT, text_arr8,title_arr,false, 2);

text_arr9 = ScriptTextParser(text_arr9);	
ScriptGenericMenu(M_TEXT, text_arr9,title_arr,false, 3);

text_arr10 = ScriptTextParser(text_arr10);	
ScriptGenericMenu(M_TEXT, text_arr10,title_arr,false, 4);

text_arr11 = ScriptTextParser(text_arr11);	
ScriptGenericMenu(M_TEXT, text_arr11,title_arr,true, 5);


}else{	
	text_arr0 ="im busy right now !/";
	text_arr0 = ScriptTextParser(text_arr0);	
	ScriptGenericMenu(M_TEXT, text_arr0,title_arr,true, 0);
	
	}
}

/*

if (state == READY)  {
	
	if(objPlayer.is_busy == false){
		
		global.recruit_archer = true;
		
		show_debug_message("a");
		if ( global.recruit_archer == true ) {
				global_arr_players[1, NAME] = "GREEN";
				global_arr_players[1, CLASS] = "ARCHER";
				global_arr_players[1, LEVEL] = 1;
				global_arr_players[1, MAX_HP] = 150;
				global_arr_players[1, CURR_HP] = 150;
				global_arr_players[1, MAX_AP] = 20;
				global_arr_players[1, CURR_AP] = 20;
				global_arr_players[1, EXP] = 0;
				global_arr_players[1, INITIATIVE] = 50;
				global_arr_players[1, MAX_WEAPON_DAMAGE] = 10;
				global_arr_players[1, HAS_SPELL_HEAL] = false;
				global_arr_players[1, HAS_SPELL_FIREBALL] = false;
				global_arr_players[1, HAS_SPELL_STUN] = false;
				global_arr_players[1, HAS_SPELL_CORRUPT] = false;
				global_arr_players[1, ANIM_IDLE] = sprArcherIdle;
				global_arr_players[1, ANIM_MOVE] = sprKnightMove;
				global_arr_players[1, ANIM_ATTACK] = sprArcherAttack;
				global_arr_players[1, ANIM_DEAD] = sprDead;
			show_debug_message("b");
		
			state = STAND_BY;
		}
	}
}
*/


