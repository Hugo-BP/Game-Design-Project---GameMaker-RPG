
spawner_room = room; 
state = STAND_BY;

if (spawner_room == global.warp_destination)
{
	visible = true;
	state = READY;
}

units = noone;
battleroom = noone;

// ANIMATIONS
curr_frame = 0; 
anim_idle = noone;
index = 0;

image_index = index;
sprite_index = anim_idle;

