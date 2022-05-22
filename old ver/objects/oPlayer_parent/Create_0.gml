// Collision layer getID
collision_map = layer_tilemap_get_id(layer_get_id("LayerCollisionTiles"));

// States that influence controls and animation
player_state = FREE;
is_in_combat = false; 
is_moving = false;

// Combat Related Variables
is_attacking = false;
attack_animation_timer = 0;
attack_animation_duration = 500;
attacking_original_x = x;

// Sprite animation Speed
image_speed = 0;

// Player Movement Speed
movement_speed = 1.0;
x_movement = 0;
y_movement = 0;

// Player Animations
spriteMove = sPlayer1_move;
spriteIdle = sPlayer1_idle; 
spriteAttack = sPlayer1_attack; 
localFrame = 0; // tells which frame is currently being used from the spritesheet

