
function ScriptCameraMovement(){
	
	// CAMERA MOVEMENT - follow player around 
	viewport_half_x = camera_get_view_width(view_camera[0]) / 2;
	viewport_half_y = camera_get_view_height(view_camera[0]) / 2; 

	camera_x = x - viewport_half_x;
	camera_y = y - viewport_half_y;

	camera_set_view_pos(view_camera[0], camera_x, camera_y);
	
	// CLAMP CAMERA TO ROOM BORDERS - so you cant see outside the room when near the room borders
	camera_x_max = clamp(camera_get_view_x(view_camera[0]), 0, room_width - camera_get_view_width(view_camera[0]));
	camera_y_max = clamp(camera_get_view_y(view_camera[0]), 0, room_height - camera_get_view_height(view_camera[0]))
	camera_set_view_pos(view_camera[0], camera_x_max, camera_y_max);
}