/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
/// Stop sound

if (music) {
audio_pause_sound(snd_ambience2);
music = false;
} else {
audio_resume_sound(snd_ambience2);
music = true;
}