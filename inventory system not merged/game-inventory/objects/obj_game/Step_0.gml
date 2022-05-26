/// @description Insert description here
// You can write your code in this editor
script_execute(MACROS);

if key_pause {
	if(room != rm_pause) {
	if(instance_exists(oPlayer_1)) {
	oPlayer_1.persistent = false;
	isPause = true;
	instance_activate_all()
	}
	room_previous(room)
	room_goto(rm_pause);
} else  {
	room_goto_previous();
	instance_deactivate_all(true);
	}
}

