
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
		state = READY;
		
	break;
	
	case READY:
		if (is_attacking)
		{
			if (x == orig_x)
			{
				x += (sprite_width);
			}
			sprite_index = anim_attack;
			
			attack_animation_timer++;
			if (attack_animation_timer >= attack_animation_duration)
			{
				sprite_index = anim_idle;
				x = orig_x;
				attack_animation_timer = 0;
				is_attacking = false;
			}
		}
		if (is_dead)
		{
			sprite_index = sprDead;
		}
		
	break;
	
}

ScriptAnimateSprite();

