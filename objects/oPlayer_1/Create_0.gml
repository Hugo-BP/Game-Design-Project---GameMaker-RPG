// Collision layer getID
collision_map = layer_tilemap_get_id(layer_get_id("LayerCollisionTiles"))

// Sprite animation Speed
image_speed = 0;

// Player Movement Speed
movement_speed = 1.0;
x_movement = 0;
y_movement = 0;

// Player Movement Animation
spriteMove = sPlayer1_move;
spriteIdle = sPlayer1_idle; 
localFrame = 0; // tells which frame is currently being used from the spritesheet










