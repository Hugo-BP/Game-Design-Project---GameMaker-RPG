
function ScriptUseItem(selected_item, selected_inventory_slot)
{
	// consumable item ex. eat apple
	if (global.item_arr[selected_item, item_stats.item_class] == item_class.consumable)
	{
		// use item for whatever
		show_debug_message("You ate the " + string(global.item_arr[selected_item, item_stats.item_name]))
		
		// apply item effects
		if (global_arr_players[global.party_leader, CURR_HP] < global_arr_players[global.party_leader, MAX_HP])
		{
			// heal
			global_arr_players[global.party_leader, CURR_HP] += global.item_arr[selected_item, item_stats.item_str];
			
			// remove overhealing
			if (global_arr_players[global.party_leader, CURR_HP] > global_arr_players[global.party_leader, MAX_HP])
			{
				global_arr_players[global.party_leader, CURR_HP] = global_arr_players[global.party_leader, MAX_HP];
			}
		}
		
		// equip/tool item
		
		// use primary/secondary items to do stuff
		
		
		// delete item from inventory
		global.inventory[selected_inventory_slot, item_slot.item_id] = -1;
		global.inventory[selected_inventory_slot, item_slot.item_charges] = -1;
		global.inventory[selected_inventory_slot, item_slot.item_amount] = -1;
		global.inventory[selected_inventory_slot, item_slot.item_is_equip] = -1;
		
	}

}