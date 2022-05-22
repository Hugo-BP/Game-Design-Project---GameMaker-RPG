




// ANIMATION SELECTION
var curr_sprite = sprite_index;
sprite_index = spriteIdle;

// if animation stops midway, restart it at 0 next time
if (curr_sprite != sprite_index) localFrame = 0;

ScriptAnimateSprite();




