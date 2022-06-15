if (not global.player_menu_state)
{
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
		
			if (is_exploring and not is_busy and not movement_disabled)
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
					case LEFT_KEY:
					input_direction = point_direction(0, 0, -1, 0);
					is_moving = true;
				
					// Movement value
					x_movement = lengthdir_x(MOVEMENT_SPEED, input_direction);
	
					break;
 
					case RIGHT_KEY:
					input_direction = point_direction(0, 0, 1, 0);
					is_moving = true;
	
					// Movement value
					x_movement = lengthdir_x(MOVEMENT_SPEED, input_direction);
	
					break;
 
					case UP_KEY:
					input_direction = point_direction(0, 0, 0, -1);
					is_moving = true;
	
					// Movement value
					y_movement = lengthdir_y(MOVEMENT_SPEED, input_direction);
	
					break;
 
					case DOWN_KEY:
					input_direction = point_direction(0, 0, 0, 1);
					is_moving = true;
	
					// Movement value
					y_movement = lengthdir_y(MOVEMENT_SPEED, input_direction);

					break;
				
					case INVENTORY_KEY:
						// if not using inventory yet then open it, else close it
						if (not inventory_open)
						{
							// block player movement
							inventory_open = true;
							is_busy = true;
							movement_disabled = true;
							
							// OPEN INVENTORY
							ScriptInventory();
						}
					break;
				
					case INTERACTION_KEY:
						// check to see if theres something to interact with
						if (not is_busy)	
						{
							var interaction = false;
							// NPC Interactions
							if (not interaction)
							{
								interaction = ScriptNPCInteract();	
							}
							// Resources
							if (not interaction)
							{
								interaction = ScriptResourceInteract();
							}
							// Workbench (crafting)
							if (not interaction)
							{
								interaction = ScriptWorkbenchInteract();
							}
							// Pick up item 
							if (not interaction)
							{
								interaction = ScriptItemInteract();
							}
						}
					break;
				}
				// Check for collisions and commit to movement value 
				if (not movement_disabled)
				{
					ScriptPlayerCollision();
				}
				// Update camera view
				ScriptCameraMovement();	
			} 
		break;
	}
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




