
new_room = Room_1;
new_room_spawn_x = 30;
new_room_spawn_y = 80;

// update invisible map tiles for collision
oPlayer_parent.collision_map = layer_tilemap_get_id(layer_get_id("LayerCollisionTiles"));
