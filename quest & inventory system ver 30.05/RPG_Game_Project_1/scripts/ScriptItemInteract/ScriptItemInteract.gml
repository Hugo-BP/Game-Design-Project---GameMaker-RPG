
function ScriptItemInteract()
{
	activate_distance = 0;

	var dir_x = lengthdir_x(activate_distance, direction);
	var dir_y = lengthdir_y(activate_distance, direction);
	
	var target = instance_place(x + dir_x, y + dir_y, objItem);
	var added_item = false;
	// if you found an NPC
	if (target != noone)
	{
		// if not stackable then try to add to inv
		//if (not global.item_arr[target.item_type, item_stats.item_stackable])
		//{
			// search for empty slot
			for (var slot=0 ; slot < global.inventory_slots ; slot++)
			{
				// if theres an empty slot
				if (global.inventory[slot, item_slot.item_id] == -1)
				{
					// add item to inventory
					global.inventory[slot, item_slot.item_id] = global.item_arr[target.item_type, item_stats.item_id];
					global.inventory[slot, item_slot.item_charges] = 1;
					global.inventory[slot, item_slot.item_amount] = 1;
					
					global.inventory[slot, item_slot.item_is_equip] = false; // TODO this isnt that well thought out
					
					added_item = true;
					break;
				}
			}
		//}
		
		// if there was an empty slot and player took item, then delete the instance
		if (added_item)
		{
			// TODO pick up item sound
			instance_destroy(target);
		}
		// else inventory is full
		else
		{
			text_arr =  "I don't have enough space in my inventory to carry this./";
			text_arr = ScriptTextParser(text_arr);
			ScriptGenericMenu(M_TEXT, text_arr, objPlayer.name, true, 0);
		}
		
		return true;
	}

return false;
}
