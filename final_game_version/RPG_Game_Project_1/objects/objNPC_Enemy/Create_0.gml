image_speed = 0;
state = INIT;
entity_type = "NPC";
index = 0;

// statuses
// BATTLE STATUSES
is_in_battle = false;
is_attacking = false;
is_defending = false;
is_corrupted = false;
corruption = 0;
is_stunned = 0;
is_dead = false;

has_healed = 0;

// Combat Related Variables
attack_animation_timer = 0;
attack_animation_duration = 50;
orig_x = x;
class = "";
npc_name = "";

// NPC HP is volatile
npc_curr_hp = 0;
npc_max_hp = 0;
npc_damage = 0;

// ANIMATIONS
curr_frame = 0; 
anim_idle = sprDefault; 
anim_attack = sprDefault; 
anim_dead = sprDefault;

show_debug_message("CREATE NPC")