
if (state == READY)  {
	
	if(objPlayer.is_busy == false){
		
		show_debug_message("a");
		if ( not global.recruit_archer ) {
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
		
			global.recruit_archer = true;
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

