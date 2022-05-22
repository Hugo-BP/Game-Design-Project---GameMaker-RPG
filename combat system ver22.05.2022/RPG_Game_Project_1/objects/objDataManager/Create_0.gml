globalvar global_arr_players, global_arr_enemies, global_arr_inv;


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

// PLAYERS
global_arr_players[0, NAME] = "RED";
global_arr_players[0, CLASS] = "Knight";
global_arr_players[0, LEVEL] = 1;
global_arr_players[0, MAX_HP] = 1500;
global_arr_players[0, CURR_HP] = 1500;
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

global_arr_players[2, NAME] = "BLUE";
global_arr_players[2, CLASS] = "Mage";
global_arr_players[2, LEVEL] = 1;
global_arr_players[2, MAX_HP] = 100;
global_arr_players[2, CURR_HP] = 100;
global_arr_players[2, MAX_AP] = 200;
global_arr_players[2, CURR_AP] = 200;
global_arr_players[2, EXP] = 1;
global_arr_players[2, INITIATIVE] = 75;
global_arr_players[2, MAX_WEAPON_DAMAGE] = 5;
global_arr_players[2, HAS_SPELL_HEAL] = false;
global_arr_players[2, HAS_SPELL_FIREBALL] = true;
global_arr_players[2, HAS_SPELL_STUN] = true;
global_arr_players[2, HAS_SPELL_CORRUPT] = true;
global_arr_players[2, ANIM_IDLE] = sprMageIdle;
global_arr_players[2, ANIM_MOVE] = sprKnightMove;
global_arr_players[2, ANIM_ATTACK] = sprKnightAttack;

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




// NPCS
global_arr_enemies[0, NAME] = "Skeleton Knight";
global_arr_enemies[0, CLASS] = "Knight";
global_arr_enemies[0, LEVEL] = 8;
global_arr_enemies[0, MAX_HP] = 400;
global_arr_enemies[0, CURR_HP] = 400;
global_arr_enemies[0, MAX_AP] = 20;
global_arr_enemies[0, CURR_AP] = 20;
global_arr_enemies[0, EXP] = 50;
global_arr_enemies[0, INITIATIVE] = 100;
global_arr_enemies[0, MAX_WEAPON_DAMAGE] = 25;
global_arr_enemies[0, ANIM_IDLE] = sprSkelKnightIdle;
global_arr_enemies[0, ANIM_ATTACK] = sprDemonAttack;

global_arr_enemies[1, NAME] = "Skeleton Archer";
global_arr_enemies[1, CLASS] = "Archer";
global_arr_enemies[1, LEVEL] = 8;
global_arr_enemies[1, MAX_HP] = 200;
global_arr_enemies[1, CURR_HP] = 200;
global_arr_enemies[1, MAX_AP] = 20;
global_arr_enemies[1, CURR_AP] = 20;
global_arr_enemies[1, EXP] = 50;
global_arr_enemies[1, INITIATIVE] = 100;
global_arr_enemies[1, MAX_WEAPON_DAMAGE] = 25;
global_arr_enemies[1, ANIM_IDLE] = sprSkelArcherIdle;
global_arr_enemies[1, ANIM_ATTACK] = sprDemonAttack;

global_arr_enemies[2, NAME] = "Demon";
global_arr_enemies[2, CLASS] = "Mage";
global_arr_enemies[2, LEVEL] = 15;
global_arr_enemies[2, MAX_HP] = 1;
global_arr_enemies[2, CURR_HP] = 1;
global_arr_enemies[2, MAX_AP] = 20;
global_arr_enemies[2, CURR_AP] = 20;
global_arr_enemies[2, EXP] = 100;
global_arr_enemies[2, INITIATIVE] = 200;
global_arr_enemies[2, MAX_WEAPON_DAMAGE] = 50;
global_arr_enemies[2, ANIM_IDLE] = sprDemonIdle;
global_arr_enemies[2, ANIM_ATTACK] = sprDemonAttack;

global_arr_enemies[3, NAME] = "Evil-Eye";
global_arr_enemies[3, CLASS] = "Healer";
global_arr_enemies[3, LEVEL] = 5;
global_arr_enemies[3, MAX_HP] = 100;
global_arr_enemies[3, CURR_HP] = 100;
global_arr_enemies[3, MAX_AP] = 20;
global_arr_enemies[3, CURR_AP] = 20;
global_arr_enemies[3, EXP] = 20;
global_arr_enemies[3, INITIATIVE] = 20;
global_arr_enemies[3, MAX_WEAPON_DAMAGE] = 25;
global_arr_enemies[3, ANIM_IDLE] = sprEvilEyeIdle;
global_arr_enemies[3, ANIM_ATTACK] = sprDemonAttack;

global_arr_enemies[4, NAME] = "Evil-Eye";
global_arr_enemies[4, CLASS] = "Healer";
global_arr_enemies[4, LEVEL] = 5;
global_arr_enemies[4, MAX_HP] = 100;
global_arr_enemies[4, CURR_HP] = 100;
global_arr_enemies[4, MAX_AP] = 20;
global_arr_enemies[4, CURR_AP] = 20;
global_arr_enemies[4, EXP] = 20;
global_arr_enemies[4, INITIATIVE] = 20;
global_arr_enemies[4, MAX_WEAPON_DAMAGE] = 25;
global_arr_enemies[4, ANIM_IDLE] = sprEvilEyeIdle;
global_arr_enemies[4, ANIM_ATTACK] = sprDemonAttack;




