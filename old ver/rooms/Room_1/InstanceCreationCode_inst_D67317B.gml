
new_room = Room_0;
new_room_spawn_x = 240;
new_room_spawn_y = 160;

// update invisible map tiles for collision
oPlayer_parent.collision_map = layer_tilemap_get_id(layer_get_id("LayerCollisionTiles"));
