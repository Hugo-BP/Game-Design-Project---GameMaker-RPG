/// @description Insert description here
// You can write your code in this editor


if (keyboard_check_pressed(vk_space)) {
	
	//se existir page +1 < total falas
	if(page+1 < array_length_1d(text)) { 
	page +=1;
	charCount = 0;
} else {
	instance_destroy();

	
	}
}
