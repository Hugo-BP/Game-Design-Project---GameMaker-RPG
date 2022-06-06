
function ScriptUseItem(selected_item, selected_inventory_slot)
{
	// eat apple
	if (global.item_arr[selected_item, item_stats.item_class] == item_class.consumable)
	{
		// use item for whatever
		show_debug_message("You ate the " + string(global.item_arr[selected_item, item_stats.item_name]))
		
		// apply item effects
		
		// delete item from inventory
		global.inventory[selected_inventory_slot, item_slot.item_id] = -1;
	}

}