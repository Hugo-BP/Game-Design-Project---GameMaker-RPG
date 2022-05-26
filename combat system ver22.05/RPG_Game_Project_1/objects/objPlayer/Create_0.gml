image_speed = 0;
state = INIT;
entity_type = "PLAYER";
index = 0;

// statuses
// BATTLE STATUSES
is_in_battle = false;
is_attacking = false;
is_defending = false;
is_corrupted = false;
corruption = 0;
is_stunned = 0;
is_dead = false;

// Combat Related Variables
attack_animation_timer = 0;
attack_animation_duration = 50;
orig_x = x;
class = global_arr_players[index, CLASS];

// ROAM
is_exploring = true;
is_moving = false;
is_busy = false;

// Movement
x_movement = 0;
y_movement = 0;
movement_disabled = false;

x = global.player_x_before_battle;
y = global.player_y_before_battle;

if (not global.player_can_warp)
{
	if ( x != global.player_warp_to_x or y != global.player_warp_to_y )
	{
		movement_disabled = true; 
					
		x = global.player_warp_to_x;
		y = global.player_warp_to_y;
			
		x_movement = x;
		y_movement = y;			
	}
}


// Collision
layer_id = layer_get_id("Tiles_Collision");
tilemap_id = layer_tilemap_get_id(layer_id);

// Stats


// Animations
curr_frame = 0; 
anim_idle = global_arr_players[index, ANIM_IDLE]; 
anim_move = global_arr_players[index, ANIM_MOVE]; ; 
anim_attack = global_arr_players[index, ANIM_ATTACK]; ; 
anim_dead = global_arr_players[index, ANIM_DEAD]; ;

