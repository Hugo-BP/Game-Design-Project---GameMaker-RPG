if (state == INIT)
{
	if (keyboard_check_released(INVENTORY_KEY))
	state = READY;
}
else 
{
	if (state == READY)
	{
		// iterate options

		if (sel_col > nr_cols-1)
		{
			sel_col = 0; 
			sel_row += 1; 
		}
		if (sel_col < 0)
		{
			sel_col = nr_cols-1; 
			sel_row -= 1; 
		}
		if (sel_row > nr_rows-1)
		{
			sel_row = 0; 
			sel_col +=1;
		}
		if (sel_row < 0)
		{
			sel_row = nr_rows-1; 
			sel_col -=1;
		}
		
		if (not inventory_locked)
		{
			sel_col += keyboard_check_released(RIGHT_KEY) - keyboard_check_released(LEFT_KEY);
			sel_row += keyboard_check_released(DOWN_KEY) - keyboard_check_released(UP_KEY);
		}
		
		if (keyboard_check_released(CONTINUE_KEY))
		{
			// USE ITEM that is in slot selected_option
			var selected_item = global.inventory[selected_option, item_slot.item_id];
			
			if (selected_item > -1)
			{
				ScriptUseItem(selected_item, selected_option);
			}
		}
		
		if (keyboard_check_released(QUIT_KEY))
		{
			objPlayer.inventory_open = false;
			objPlayer.is_busy = false;
			objPlayer.movement_disabled = false;
			instance_destroy();
		}
	
		if (keyboard_check_released(INVENTORY_KEY))
		{
			objPlayer.inventory_open = false;
			objPlayer.is_busy = false;
			objPlayer.movement_disabled = false;
			instance_destroy();
		}
	
	
	}
}