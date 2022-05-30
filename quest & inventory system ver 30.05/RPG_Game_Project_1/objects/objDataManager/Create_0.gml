
globalvar global_arr_players, global_arr_friendlies, global_arr_enemies, global_spawner_units,
globalvar global_arr_inv, global_arr_spellbook;

// PLAYER PURSE
global.purse = 0;

// WARPING
global.player_just_warped = false;
global.warp_destination = Room_0;
global.player_warp_to_x = TILESIZE*3;
global.player_warp_to_y = TILESIZE*3;
global.player_prev_room = Room_0;

// COMBAT
global.player_x_before_battle = TILESIZE*3;
global.player_y_before_battle = TILESIZE*3;
global.curr_active_battle_spawn = noone;




//enum ITEM {
//  SMALL_MANA_POTION,
//  MEDIUM_MANA_POTION,
//  LARGE_MANA_POTION
//}

//enum STAT {
//  NAME,
//  EFFECT,
//  POWER
//}

//global.dictionary[ITEM.SMALL_MANA_POTION, STAT.NAME] = "Small Mana Potion";
//global.dictionary[ITEM.SMALL_MANA_POTION, STAT.EFFECT] = scr_ManaHeal;
//global.dictionary[ITEM.SMALL_MANA_POTION, STAT.POWER] = 25;
//...

//SPELLBOOKS
// SPELLBOOK MENU TEXT
global_arr_spellbook[HAS_SPELL_HEAL] = "HEAL";
global_arr_spellbook[HAS_SPELL_FIREBALL] = "FIREBALL";
global_arr_spellbook[HAS_SPELL_STUN] = "STUN";
global_arr_spellbook[HAS_SPELL_CORRUPT] = "CORRUPT";

//INVENTORIES
// global_arr_inv[player, inv_slot_x] = item
global_arr_inv[0,0] = "Axe";
global_arr_inv[0,1] = "";
global_arr_inv[0,2] = "Raw Beef";
global_arr_inv[0,3] = "Raw Pike";
global_arr_inv[0,4] = "Egg";

global_arr_inv[1,0] = "Talisman";
global_arr_inv[1,1] = "Lucky Coin";
global_arr_inv[1,2] = "Arrow Tip";
global_arr_inv[1,3] = "Arrow shaft";
global_arr_inv[1,4] = "Knife";

global_arr_inv[2,0] = "AP potion";
global_arr_inv[2,1] = "";
global_arr_inv[2,2] = "Old Tome";
global_arr_inv[2,3] = "Maple Herb";
global_arr_inv[2,4] = "";

global_arr_inv[3,0] = "AP potion";
global_arr_inv[3,1] = "HP potion";
global_arr_inv[3,2] = "HP potion";
global_arr_inv[3,3] = "Menta Herb";
global_arr_inv[3,4] = "Holy Elixir";


#region PLAYER_ARR
// PLAYERS
global_arr_players[0, NAME] = "RED";
global_arr_players[0, CLASS] = "Knight";
global_arr_players[0, LEVEL] = 1;
global_arr_players[0, MAX_HP] = 250;
global_arr_players[0, CURR_HP] = 250;
global_arr_players[0, MAX_AP] = 20;
global_arr_players[0, CURR_AP] = 20;
global_arr_players[0, EXP] = 0;
global_arr_players[0, INITIATIVE] = 1000;
global_arr_players[0, MAX_WEAPON_DAMAGE] = 40;
global_arr_players[0, HAS_SPELL_HEAL] = false;
global_arr_players[0, HAS_SPELL_FIREBALL] = false;
global_arr_players[0, HAS_SPELL_STUN] = false;
global_arr_players[0, HAS_SPELL_CORRUPT] = false;
global_arr_players[0, ANIM_IDLE] = sprKnightIdle;
global_arr_players[0, ANIM_MOVE] = sprKnightMove;
global_arr_players[0, ANIM_ATTACK] = sprKnightAttack;
global_arr_players[0, ANIM_DEAD] = sprDead;


global_arr_players[1, NAME] = "GREEN";
global_arr_players[1, CLASS] = "Archer";
global_arr_players[1, LEVEL] = 1;
global_arr_players[1, MAX_HP] = 150;
global_arr_players[1, CURR_HP] = 150;
global_arr_players[1, MAX_AP] = 20;
global_arr_players[1, CURR_AP] = 20;
global_arr_players[1, EXP] = 0;
global_arr_players[1, INITIATIVE] = 50;
global_arr_players[1, MAX_WEAPON_DAMAGE] = 10;
global_arr_players[1, HAS_SPELL_HEAL] = false;
global_arr_players[1, HAS_SPELL_FIREBALL] = false;
global_arr_players[1, HAS_SPELL_STUN] = false;
global_arr_players[1, HAS_SPELL_CORRUPT] = false;
global_arr_players[1, ANIM_IDLE] = sprArcherIdle;
global_arr_players[1, ANIM_MOVE] = sprKnightMove;
global_arr_players[1, ANIM_ATTACK] = sprKnightAttack;
global_arr_players[1, ANIM_DEAD] = sprDead;

global_arr_players[2, NAME] = "BLUE";
global_arr_players[2, CLASS] = "Mage";
global_arr_players[2, LEVEL] = 1;
global_arr_players[2, MAX_HP] = 100;
global_arr_players[2, CURR_HP] = 100;
global_arr_players[2, MAX_AP] = 200;
global_arr_players[2, CURR_AP] = 200;
global_arr_players[2, EXP] = 0;
global_arr_players[2, INITIATIVE] = 75;
global_arr_players[2, MAX_WEAPON_DAMAGE] = 5;
global_arr_players[2, HAS_SPELL_HEAL] = false;
global_arr_players[2, HAS_SPELL_FIREBALL] = true;
global_arr_players[2, HAS_SPELL_STUN] = true;
global_arr_players[2, HAS_SPELL_CORRUPT] = true;
global_arr_players[2, ANIM_IDLE] = sprMageIdle;
global_arr_players[2, ANIM_MOVE] = sprKnightMove;
global_arr_players[2, ANIM_ATTACK] = sprKnightAttack;
global_arr_players[2, ANIM_DEAD] = sprDead;

global_arr_players[3, NAME] = "YELLOW";
global_arr_players[3, CLASS] = "Healer";
global_arr_players[3, LEVEL] = 1;
global_arr_players[3, MAX_HP] = 75;
global_arr_players[3, CURR_HP] = 75;
global_arr_players[3, MAX_AP] = 20;
global_arr_players[3, CURR_AP] = 20;
global_arr_players[3, EXP] = 0;
global_arr_players[3, INITIATIVE] = 25;
global_arr_players[3, MAX_WEAPON_DAMAGE] = 10;
global_arr_players[3, HAS_SPELL_HEAL] = true;
global_arr_players[3, HAS_SPELL_FIREBALL] = false;
global_arr_players[3, HAS_SPELL_STUN] = false;
global_arr_players[3, HAS_SPELL_CORRUPT] = false;
global_arr_players[3, ANIM_IDLE] = SprHealerIdle;
global_arr_players[3, ANIM_MOVE] = sprKnightMove;
global_arr_players[3, ANIM_ATTACK] = sprKnightAttack;
global_arr_players[3, ANIM_DEAD] = sprDead;

#endregion

enum enemies
{
slime,
goblin,
hobgoblin,
wolf,
bandit,
evil_eye,
zombie,
skeleton,
ghost,
skeleton_knight,
skeleton_archer,
ghoul,
necromancer,
werewolf,
lesser_demon,
demon,
vampyre,
lich
}

#region NPC_ARR
// NPCS
global_arr_enemies[enemies.skeleton_knight, NAME] = "Skeleton Knight";
global_arr_enemies[enemies.skeleton_knight, CLASS] = "Knight";
global_arr_enemies[enemies.skeleton_knight, LEVEL] = 8;
global_arr_enemies[enemies.skeleton_knight, MAX_HP] = 400;
global_arr_enemies[enemies.skeleton_knight, CURR_HP] = 400;
global_arr_enemies[enemies.skeleton_knight, MAX_AP] = 20;
global_arr_enemies[enemies.skeleton_knight, CURR_AP] = 20;
global_arr_enemies[enemies.skeleton_knight, EXP] = 50;
global_arr_enemies[enemies.skeleton_knight, INITIATIVE] = 100;
global_arr_enemies[enemies.skeleton_knight, MAX_WEAPON_DAMAGE] = 25;
global_arr_enemies[enemies.skeleton_knight, ANIM_IDLE] = sprSkelKnightIdle;
global_arr_enemies[enemies.skeleton_knight, ANIM_ATTACK] = sprDemonAttack;
global_arr_enemies[enemies.skeleton_knight, ANIM_DEAD] = sprDead;

global_arr_enemies[enemies.skeleton_archer, NAME] = "Skeleton Archer";
global_arr_enemies[enemies.skeleton_archer, CLASS] = "Archer";
global_arr_enemies[enemies.skeleton_archer, LEVEL] = 8;
global_arr_enemies[enemies.skeleton_archer, MAX_HP] = 200;
global_arr_enemies[enemies.skeleton_archer, CURR_HP] = 200;
global_arr_enemies[enemies.skeleton_archer, MAX_AP] = 20;
global_arr_enemies[enemies.skeleton_archer, CURR_AP] = 20;
global_arr_enemies[enemies.skeleton_archer, EXP] = 50;
global_arr_enemies[enemies.skeleton_archer, INITIATIVE] = 100;
global_arr_enemies[enemies.skeleton_archer, MAX_WEAPON_DAMAGE] = 25;
global_arr_enemies[enemies.skeleton_archer, ANIM_IDLE] = sprSkelArcherIdle;
global_arr_enemies[enemies.skeleton_archer, ANIM_ATTACK] = sprDemonAttack;
global_arr_enemies[enemies.skeleton_archer, ANIM_DEAD] = sprDead;

global_arr_enemies[enemies.demon, NAME] = "Demon";
global_arr_enemies[enemies.demon, CLASS] = "Mage";
global_arr_enemies[enemies.demon, LEVEL] = 15;
global_arr_enemies[enemies.demon, MAX_HP] = 1;
global_arr_enemies[enemies.demon, CURR_HP] = 1;
global_arr_enemies[enemies.demon, MAX_AP] = 20;
global_arr_enemies[enemies.demon, CURR_AP] = 20;
global_arr_enemies[enemies.demon, EXP] = 100;
global_arr_enemies[enemies.demon, INITIATIVE] = 200;
global_arr_enemies[enemies.demon, MAX_WEAPON_DAMAGE] = 25;
global_arr_enemies[enemies.demon, ANIM_IDLE] = sprDemonIdle;
global_arr_enemies[enemies.demon, ANIM_ATTACK] = sprDemonAttack;
global_arr_enemies[enemies.demon, ANIM_DEAD] = sprDead;

global_arr_enemies[enemies.evil_eye, NAME] = "Evil-Eye";
global_arr_enemies[enemies.evil_eye, CLASS] = "Healer";
global_arr_enemies[enemies.evil_eye, LEVEL] = 5;
global_arr_enemies[enemies.evil_eye, MAX_HP] = 100;
global_arr_enemies[enemies.evil_eye, CURR_HP] = 100;
global_arr_enemies[enemies.evil_eye, MAX_AP] = 20;
global_arr_enemies[enemies.evil_eye, CURR_AP] = 20;
global_arr_enemies[enemies.evil_eye, EXP] = 20;
global_arr_enemies[enemies.evil_eye, INITIATIVE] = 20;
global_arr_enemies[enemies.evil_eye, MAX_WEAPON_DAMAGE] = 25;
global_arr_enemies[enemies.evil_eye, ANIM_IDLE] = sprEvilEyeIdle;
global_arr_enemies[enemies.evil_eye, ANIM_ATTACK] = sprDemonAttack;
global_arr_enemies[enemies.evil_eye, ANIM_DEAD] = sprDead;


#endregion



enum friendlies
{
	villager,
	inn_keeper,
	guard,
	knight,
	archer,
	mage,
	healer,
	clerk_general, // general store
	clerk_herb,	   // alchemist potions herbs secondary ingredients
	clerk_forge,   // swords armour stuff made from metals etc
	clerk_fletch,  // bows arrows etc
	clerk_leather, // leather armour, boots, gloves etc
	clerk_mage,    // runes, staves, amulets, talismans, etc
	clerk_seamstress, // cloth sewing materials cloaks etc
	clerk_wood,	  // wooden raw materials - logs, planks, nails, saw, etc
	clerk_ore,	  // mined raw materials - ores, gems
	clerk_fish,	  // fishmonger
	clerk_meat,	  // butcher
	clerk_produce // fruit & vegetables
}

global.npc_text[friendlies.villager, 0] = "The weather sure is nice today!/";
global.npc_text[friendlies.villager, 1] = "*Yawn*/";
global.npc_text[friendlies.villager, 2] = "Bleh!/I got my skirt full of dirt.../";
global.npc_text[friendlies.villager, 3] = "I think I saw some monters in the fields today.../You wouldnt mind checking that out would you?/";
global.npc_text[friendlies.villager, 4] = "I read a book about monsters the other day!/Do you think Vampyres really exist?/It would be kinda scary if they did...";

global.npc_text[friendlies.inn_keeper, 0] = "The weather sure is nice today!/Do you need a place to rest?/5 coins it'll be!/";
global.npc_text[friendlies.inn_keeper, 1] = "Welcome! Feel free to rest at my inn!/A night costs only 5 coins!/";
global.npc_text[friendlies.inn_keeper, 2] = "You look like you need a good nights' sleep!/How about it? 5 coins a night!/";

global_arr_friendlies[friendlies.villager, NAME] = "Village Girl";
global_arr_friendlies[friendlies.villager, CLASS] = "Villager";
global_arr_friendlies[friendlies.villager, TEXT] = global.npc_text[friendlies.villager];
global_arr_friendlies[friendlies.villager, STORE] = noone;
global_arr_friendlies[friendlies.villager, ANIM_IDLE] = sprVillageGirlIdle;

global_arr_friendlies[friendlies.inn_keeper, NAME] = "Inn Keeper";
global_arr_friendlies[friendlies.inn_keeper, CLASS] = "Inn Keeper";
global_arr_friendlies[friendlies.inn_keeper, TEXT] = global.npc_text[friendlies.inn_keeper];
global_arr_friendlies[friendlies.inn_keeper, STORE] = ["Inn stay", 5];
global_arr_friendlies[friendlies.inn_keeper, ANIM_IDLE] = sprInnKeeperIdle;



// DEBUG
random_set_seed(342);













