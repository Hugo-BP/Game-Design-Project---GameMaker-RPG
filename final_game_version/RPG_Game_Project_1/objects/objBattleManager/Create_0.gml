
state = INIT; // STAND_BY; // INIT
result = "";
gameover = noone;
turn_timer = 0;

// INIT LISTS
ds_players = -1;
ds_npcs = -1;
ds_selectable_npc = -1;		// used to iterate between availabe npcs to attack
ds_selectable_player = -1;  // used to iterate between availabe players to attack with
ds_spellbook = -1;
end_text = "nothing";

// BATTLE MENU TEXT
cbt_menu_arr[0] = "ATK"
cbt_menu_arr[1] = "DEF"
cbt_menu_arr[2] = "SPL"
cbt_menu_arr[3] = "INV"
cbt_menu_arr[4] = "RUN"

// Battle Room - middle spot is always filled first

// NPC PARTY
// Middle Front
npc_spawn_pos[0, X_COORD] = 60;
npc_spawn_pos[0, Y_COORD] = room_height/2 + 45;
// Bottom Front
npc_spawn_pos[1, X_COORD] = 80;
npc_spawn_pos[1, Y_COORD] = room_height/2 + 15;
// Top Front
npc_spawn_pos[2, X_COORD] = 90;
npc_spawn_pos[2, Y_COORD] = room_height/2 + 65;
// Top Back 
npc_spawn_pos[3, X_COORD] = 25;
npc_spawn_pos[3, Y_COORD] = room_height/2 + 30;
// Bottom Back
npc_spawn_pos[4, X_COORD] = 30;
npc_spawn_pos[4, Y_COORD] = room_height/2 + 65;

// HERO PARTY
// Middle
player_spawn_pos[0, X_COORD] = 230;
player_spawn_pos[0, Y_COORD] = room_height/2 + 35;
// TOP
player_spawn_pos[1, X_COORD] = 200;
player_spawn_pos[1, Y_COORD] = room_height/2 + 25;
// Bottom
player_spawn_pos[2, X_COORD] = 215;
player_spawn_pos[2, Y_COORD] = room_height/2 + 65;
// Back
player_spawn_pos[3, X_COORD] = 270;
player_spawn_pos[3, Y_COORD] = room_height/2 + 45;
















