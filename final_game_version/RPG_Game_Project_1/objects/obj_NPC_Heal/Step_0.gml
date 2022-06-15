if (state == READY)  {
	
	if(objPlayer.is_busy == false){
		
		global.recruit_healer = true;
		
		show_debug_message("a");
		if ( global.recruit_healer == true ) {
				
				global_arr_players[3, NAME] = "YELLOW";
				global_arr_players[3, CLASS] = "HEALER";
				global_arr_players[3, LEVEL] = 1;
				global_arr_players[3, MAX_HP] = 75;
				global_arr_players[3, CURR_HP] = 75;
				global_arr_players[3, MAX_AP] = 20;
				global_arr_players[3, CURR_AP] = 20;
				global_arr_players[3, EXP] = 0;
				global_arr_players[3, INITIATIVE] = 25;
				global_arr_players[3, MAX_WEAPON_DAMAGE] = 10;
				global_arr_players[3, HAS_SPELL_HEAL] = true;
				global_arr_players[3, HAS_SPELL_FIREBALL] = false;
				global_arr_players[3, HAS_SPELL_STUN] = false;
				global_arr_players[3, HAS_SPELL_CORRUPT] = false;
				global_arr_players[3, ANIM_IDLE] = sprHealerIdle;
				global_arr_players[3, ANIM_MOVE] = sprKnightMove;
				global_arr_players[3, ANIM_ATTACK] = sprHealerAttack;
				global_arr_players[3, ANIM_DEAD] = sprDead;
				
			show_debug_message("b");
		
			state = STAND_BY;
		}
	}
}

switch(state)
{
	case INIT:
		image_index = index;
		// ANIMATION 
		var curr_sprite = sprite_index;
		
		sprite_index = anim_idle;
		// if animation stops midway, restart it at 0 next time
		if (curr_sprite != sprite_index) 
		{
			localFrame = 0;
		}
	break;
}

ScriptAnimateSprite();

