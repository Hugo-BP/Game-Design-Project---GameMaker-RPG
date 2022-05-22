
// Player Combat 
enum cbt_phase
{
	init,
	start_turn,
	end_turn,
	wait,
	process,
	check_finished,
	win,
	lose
}

combat_phase = cbt_phase.init;

// Battle Room - middle spot is always filled first
// NPC PARTY
// Middle Front
npc_spawn_pos[0, X_COORD] = 80;
npc_spawn_pos[0, Y_COORD] = room_height/2;
// Bottom Front
npc_spawn_pos[1, X_COORD] = 80;
npc_spawn_pos[1, Y_COORD] = npc_spawn_pos[0, Y_COORD] - (SPRITE_DIM+20);
// Top Front
npc_spawn_pos[2, X_COORD] = 80;
npc_spawn_pos[2, Y_COORD] = npc_spawn_pos[0, Y_COORD] + (SPRITE_DIM+20);
// Top Back 
npc_spawn_pos[3, X_COORD] = 50;
npc_spawn_pos[3, Y_COORD] = room_height/2 - 25;
// Bottom Back
npc_spawn_pos[4, X_COORD] = 50;
npc_spawn_pos[4, Y_COORD] = room_height/2 + 25;

// HERO PARTY
// Middle
hero_spawn_pos[0, X_COORD] = 270;
hero_spawn_pos[0, Y_COORD] = room_height/2;
// TOP
hero_spawn_pos[1, X_COORD] = 270;
hero_spawn_pos[1, Y_COORD] = hero_spawn_pos[0, Y_COORD] - (SPRITE_DIM+20);
// Bottom
hero_spawn_pos[2, X_COORD] = 270;
hero_spawn_pos[2, Y_COORD] = hero_spawn_pos[0, Y_COORD] + (SPRITE_DIM+20);




