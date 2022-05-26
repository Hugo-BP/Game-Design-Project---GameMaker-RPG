/// @description Insert description here
// You can write your code in this editor

if(can_be_picked_up == false) {
	
	var player = instance_place(x,y,oPlayer_1);
	
	if(player == noone) can_be_picked_up  = true;
}
