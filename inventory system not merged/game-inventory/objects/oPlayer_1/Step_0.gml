// Player keypress events
// Player interact action key - pick up item, talk to NPC, gather resource
keyAction = keyboard_check_pressed(vk_space);

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

// Update Player Sprite 
var curr_sprite = sprite_index;
if (is_moving)
{
	direction = input_direction;
	sprite_index = spriteMove;
} else sprite_index = spriteIdle;

// if animation stops midway, restart it at 0 next time
if (curr_sprite != sprite_index) localFrame = 0;

ScriptAnimateSprite();

#region PICK UP items

var item = instance_place(x,y,obj_item);

if(item != noone && item.can_be_picked_up == true){
	show_debug_message("item picked up");
	ds_list_add(global.inventory,item.image_index);
	with item instance_destroy();
}
#endregion

#region Select an item

if(keyboard_check_pressed(vk_left) ){
	if(selected_item - 1) >= 0 selected_item --;
	else selected_item = ds_list_size(global.inventory) -1 ;
}

if(keyboard_check_pressed(vk_right) ){
	if(selected_item + 1) < ds_list_size(global.inventory) selected_item++;
	else selected_item = 0;
}

#endregion

#region	Drop an item

if(keyboard_check_pressed(vk_enter) ){

var  item = global.inventory[| selected_item];

if(item != undefined){
	var dropped_item = instance_create_layer(x,y,layer,obj_item);
	dropped_item.image_index = item;
	
	scr_remove_item();
	
	show_debug_message("item dropped" + string(selected_item))
	}
}

#endregion 

#region
if(keyboard_check_pressed(vk_enter) ){
	var  item = global.inventory[| selected_item];
	
	var script_to_run = on_use[item];
	
	if(script_to_run != -1) script_execute(script_to_run);
}
#endregion


