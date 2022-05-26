
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
if(place_meeting(x,y,objPlayer)) {
	if (keyboard_check_pressed(ord("T"))) || (keyboard_check_pressed(vk_space)){
		if (myTextbox == noone) {
		create_textbox(text_id);
		 myTextbox= instance_create_layer(x,y, "Text", obj_textbox);
		} else {instance_destroy(myTextbox);
	 myTextbox = noone;
	 
	  }
	 
	}
	} 


