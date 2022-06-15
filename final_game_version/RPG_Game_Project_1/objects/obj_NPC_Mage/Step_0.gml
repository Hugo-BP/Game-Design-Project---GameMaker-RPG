
if (state == READY)  {
	
	if(objPlayer.is_busy == false){
		
		global.recruit_mage = true;
		
		show_debug_message("a");
		if ( global.recruit_mage == true ) {

			global_arr_players[2, NAME] = "BLUE";
			global_arr_players[2, CLASS] = "MAGE";
			global_arr_players[2, LEVEL] = 1;
			global_arr_players[2, MAX_HP] = 100;
			global_arr_players[2, CURR_HP] = 100;
			global_arr_players[2, MAX_AP] = 200;
			global_arr_players[2, CURR_AP] = 200;
			global_arr_players[2, EXP] = 0;
			global_arr_players[2, INITIATIVE] = 75;
			global_arr_players[2, MAX_WEAPON_DAMAGE] = 15;
			global_arr_players[2, HAS_SPELL_HEAL] = false;
			global_arr_players[2, HAS_SPELL_FIREBALL] = true;
			global_arr_players[2, HAS_SPELL_STUN] = true;
			global_arr_players[2, HAS_SPELL_CORRUPT] = true;
			global_arr_players[2, ANIM_IDLE] = sprMageIdle;
			global_arr_players[2, ANIM_MOVE] = sprKnightMove;
			global_arr_players[2, ANIM_ATTACK] = sprMageAttack;
			global_arr_players[2, ANIM_DEAD] = sprDead;
		
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

