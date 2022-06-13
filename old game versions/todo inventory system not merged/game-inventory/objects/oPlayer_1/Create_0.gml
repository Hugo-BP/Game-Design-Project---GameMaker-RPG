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

global.inventory = ds_list_create();

selected_item = 0;

global.playerHP = 10;
global.equipped_item = -1;


#region

enum e_items{potion,key,food}

on_use[e_items.potion] = scr_heal();
on_use[e_items.key] = scr_equip_item();
on_use[e_items.food] = scr_heal();

for( var i = 0; i < 3; i++){
	show_debug_message("on_use [" + string(i) + "] :" + string(on_use[i]));
}

#endregion







