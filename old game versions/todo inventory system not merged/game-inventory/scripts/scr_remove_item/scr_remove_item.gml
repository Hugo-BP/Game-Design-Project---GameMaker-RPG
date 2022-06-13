// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_remove_item(){
	
	ds_list_delete(global.inventory, selected_item);
	
	if(selected_item >= ds_list_size(global.inventory)&& selected_item > 0)
		selected_item --;
}