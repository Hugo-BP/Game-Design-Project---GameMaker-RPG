
switch(state)
{
	// INITIALIZE OBJECT
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

	// OBJECT READY TO USE
	case READY:
		// reset is_moving
		is_moving = false;
		
		if (is_in_battle)
		{
			is_exploring = false;
			movement_disabled = true;
			input_direction = point_direction(0, 0, -1, 0);
			direction = input_direction;
		}
		
		if (is_attacking)
		{
			if (x == orig_x)
			{
				x -= (sprite_width);
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
			sprite_index = anim_dead;
		}
		
		if (is_exploring and not is_busy)
		{
			// Reset Movement Values 
			is_moving = false;
			movement_disabled = false;
			input_direction = point_direction(0, 0, 0, 0);
			x_movement = 0;
			y_movement = 0;

			// Movement Logic - No diagonal movement allowed
			// Switch gets movement direction and movement value
			switch(keyboard_key)
			{
				case vk_left: case ord("A"):
				input_direction = point_direction(0, 0, -1, 0);
				is_moving = true;
				
				// Movement value
				x_movement = lengthdir_x(MOVEMENT_SPEED, input_direction);
	
				break;
 
				case vk_right: case ord("D"):
				input_direction = point_direction(0, 0, 1, 0);
				is_moving = true;
	
				// Movement value
				x_movement = lengthdir_x(MOVEMENT_SPEED, input_direction);
	
				break;
 
				case vk_up: case ord("W"):
				input_direction = point_direction(0, 0, 0, -1);
				is_moving = true;
	
				// Movement value
				y_movement = lengthdir_y(MOVEMENT_SPEED, input_direction);
	
				break;
 
				case vk_down: case ord("S"):
				input_direction = point_direction(0, 0, 0, 1);
				is_moving = true;
	
				// Movement value
				y_movement = lengthdir_y(MOVEMENT_SPEED, input_direction);

				break;
				
				case ord("I"):
					// open inventory/stats/equipment
					if (not is_busy)
					{
						is_busy = true;
						is_moving = false;
						
						// CHECK
						show_debug_message("im busy inventory")
						
					}
					// close inventory/stats/equipment
					else
					{
						is_busy = false;
					}
				break;
				
				case ord("O"):
					// TODO open text window asking yes no etc
					is_busy = true;
					is_moving = false;
						
					// CHECK FOR COLLISION WITH INTERACTIBLE ENTITIES
					// Warp
					ScriptWarpCollision();
					// NPC
						
					// Resources
						
					// Workbench (crafting)
						
					// player finished interaction
					is_busy = false;
				break;
				
			}
   
			// Check for collisions and commit to movement value 
			if (not movement_disabled)
			{
				PlayerCollision();
			}
			
			// Update camera view
			ScriptCameraMovement();
			
		}
		
		if (is_exploring and is_busy)
		{
			switch(keyboard_key)
			{
				case vk_escape:
					// QUIT action
					is_busy = false;
					
				break;
			}
		}
		
	break;
}
			
// ANIMATION		
var curr_sprite = sprite_index;

if (is_moving)
{
	direction = input_direction;
	sprite_index = anim_move;
} 
else // TODO check if this causes issues with battle anims
{
	sprite_index = anim_idle;
}
// reset animation if stopped midway
if (curr_sprite != sprite_index)
{ 
	localFrame = 0;
}

ScriptAnimateSprite();




