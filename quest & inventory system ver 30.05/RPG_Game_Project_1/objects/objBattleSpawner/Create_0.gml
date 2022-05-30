
spawner_room = room; 
state = STAND_BY;

if (spawner_room == global.warp_destination)
{
	visible = true;
	state = READY;
}

units = noone;
battleroom = noone;
manager = noone;

// ANIMATIONS
curr_frame = 0; 
anim_idle = noone;

image_index = 0;
sprite_index = anim_idle;

