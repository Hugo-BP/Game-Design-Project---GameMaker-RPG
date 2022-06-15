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
name = global_arr_players[index, NAME];
is_exploring = true;
is_moving = false;
is_busy = false;
inventory_open = false;
selected_item = noone;

// Movement
x_movement = 0;
y_movement = 0;
movement_disabled = false;

x = global.player_x_before_battle;
y = global.player_y_before_battle;

if (global.player_just_warped)
{
	x = global.player_warp_to_x;
	y = global.player_warp_to_y;
	global.player_just_warped = false;
}


// Collision
layer_id = layer_get_id("Tiles_Collision");
tilemap_id = layer_tilemap_get_id(layer_id);

// Animations
curr_frame = 0; 
anim_idle = global_arr_players[index, ANIM_IDLE]; 
anim_move = global_arr_players[index, ANIM_MOVE]; 
anim_attack = global_arr_players[index, ANIM_ATTACK]; 
anim_dead = global_arr_players[index, ANIM_DEAD]; 

show_debug_message("CREATE PL")