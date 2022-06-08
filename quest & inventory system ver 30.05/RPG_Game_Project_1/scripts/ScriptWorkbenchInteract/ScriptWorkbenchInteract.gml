
function ScriptWorkbenchInteract()
{
	activate_distance = TILESIZE/3;
	var interact = false;

	var dir_x = lengthdir_x(activate_distance, direction);
	var dir_y = lengthdir_y(activate_distance, direction);
	
	var target = instance_place(x + dir_x, y + dir_y, objWorkbench);
	
	// if you found an NPC
	if (target != noone)
	{
		// start interaction
		is_busy = true;
		movement_disabled = true;
		interact = true;
	}
	
	if (interact)
	{
		show_debug_message("ree");
		
		
		
		
		// Interaction finished
		is_busy = false;
		movement_disabled = false;
		
		return true;
	}
	
	return false;
}
