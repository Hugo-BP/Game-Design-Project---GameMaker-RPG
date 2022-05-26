// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function scr_equip_item(){
	
	if(global.equipped_item != -1){
		ds_list_add(global.inventory,global.equipped_item);
	}
	global.equipped_item = global.inventory[| selected_item];
	
	scr_remove_item();
}