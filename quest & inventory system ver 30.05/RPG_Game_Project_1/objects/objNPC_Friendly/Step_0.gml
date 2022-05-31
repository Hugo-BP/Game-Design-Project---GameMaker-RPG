
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

