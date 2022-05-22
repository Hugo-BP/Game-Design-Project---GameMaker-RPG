

if (player_state == FREE) 
{
	// Player keypress events
	// Player interact action key - pick up item, talk to NPC, gather resource
	keyAction = keyboard_check_pressed(ord("T"));

	// Player check inventory menu
	keyInventory = keyboard_check_pressed(ord("I"));

	// Reset Movement Values 
	is_moving = false;
	input_direction = point_direction(0, 0, 0, 0);
	x_movement = 0;
	y_movement = 0;

	// Movement Logic - No diagonal movement allowed
	// Switch gets movement direction and movement value
	switch(keyboard_key)
	   {
	   case vk_left:	//case ord("A"):
		input_direction = point_direction(0, 0, -1, 0);
		is_moving = true;
	
		// Movement value
		x_movement = lengthdir_x(movement_speed, input_direction);
	
	    break;
 
	   case vk_right:	//case ord("D"):
		input_direction = point_direction(0, 0, 1, 0);
		is_moving = true;
	
		// Movement value
		x_movement = lengthdir_x(movement_speed, input_direction);
	
	    break;
 
	   case vk_up:	//case ord("W"):
		input_direction = point_direction(0, 0, 0, -1);
		is_moving = true;
	
		// Movement value
		y_movement = lengthdir_y(movement_speed, input_direction);
	
	    break;
 
	   case vk_down:	//case ord("S"):
		input_direction = point_direction(0, 0, 0, 1);
		is_moving = true;
	
		// Movement value
		y_movement = lengthdir_y(movement_speed, input_direction);

	    break;
	   }
   
	// Check for collisions and commit to movement value 
	PlayerCollision();
}


// STATES AND ANIMATION SELECTION 
var curr_sprite = sprite_index;

// IF PLAYER IS INSIDE A BATTLE ROOM
if (is_in_combat) 
{
	input_direction = point_direction(0, 0, -1, 0);
	direction = input_direction;
	// IF PLAYER ATTACKS NPC
	if (is_attacking)
	{
		if (x == attacking_original_x)
		{
			x -= (sprite_width * 3);
		}
		sprite_index = spriteAttack;
		attack_animation_timer++;
		if (attack_animation_timer >= attack_animation_duration)
		{
			sprite_index = spriteIdle;
			x += (sprite_width * 3);
			attack_animation_timer = 0;
			is_attacking = false;
		}
	}
}

// IF THERES USER MOVEMENT INPUT
if (is_moving)
{
	direction = input_direction;
	sprite_index = spriteMove;
} 


// IF THE PLAYER IS IDLE
else 
{
	sprite_index = spriteIdle;
}
// if animation stops midway, restart it at 0 next time
if (curr_sprite != sprite_index) localFrame = 0;

ScriptAnimateSprite();


















