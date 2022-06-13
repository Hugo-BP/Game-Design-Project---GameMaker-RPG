// SETTINGS
#macro FRAME_RATE 60
#macro TILESIZE 16
#macro MOVEMENT_SPEED 1


// READABILITY
#macro X_COORD 0
#macro Y_COORD 1

// STATES USED BY OBJECTS ( NPC / PLAYER / BATTLE MANAGER / ETC )
#macro INIT 0   // initialize object
#macro READY 1  // object ready 
#macro BATTLE_END 2 // run away / every1 died
#macro STAND_BY 3
#macro REMOVE 4
#macro COMPLETED 5

// Interaction - Types of GUI menu to draw
#macro M_OPTIONS 0
#macro M_TEXT 1
#macro MAX_TEXT_LEN 50
#macro MAX_NR_OPTIONS 5
#macro INTERACTION_MENU_MARGIN 8

// CONTROLS
// actions
#macro INTERACTION_KEY ord("O")
#macro INVENTORY_KEY ord("I")
#macro CONTINUE_KEY vk_space
#macro QUIT_KEY vk_escape
#macro PLAYER_MENU_KEY vk_enter
// movement
#macro LEFT_KEY vk_left
#macro RIGHT_KEY vk_right
#macro UP_KEY vk_up
#macro DOWN_KEY vk_down

// COMBAT MENUS
// MENU possible menus
#macro DECISION_MENU 0

// MENU decision menu
#macro DECIDING 0
#macro ATTACK 1
#macro DEFEND 2
#macro SPELL 3
#macro INV 4
#macro SELECT_ITEM_TARGET 6

// MENU spell menu
#macro CHOOSING_SPELL 0
#macro USING_SPELL 1

#macro INVENTORY_SIZE 5

// Pointer placement TODO prolly better to make the menu in a static size and spot
#macro BUFFER 3

// COMBAT SIZES
#macro MAX_NPC_GROUP_SIZE 5
#macro MAX_HERO_GROUP_SIZE 4
#macro MAX_SPAWNS_PER_ROOM 5

#macro ATTACK_COOLDOWN 60

// these are used in the persistent data storage
#macro NAME 0
#macro CLASS 1
#macro LEVEL 2
#macro MAX_HP 3
#macro CURR_HP 4
#macro MAX_AP 5
#macro CURR_AP 6
#macro EXP 7
#macro INITIATIVE 8
#macro MAX_WEAPON_DAMAGE 9
#macro HAS_SPELL_HEAL 10
#macro HAS_SPELL_FIREBALL 11
#macro HAS_SPELL_STUN 12
#macro HAS_SPELL_CORRUPT 13
#macro ANIM_IDLE 14
#macro ANIM_MOVE 15
#macro ANIM_ATTACK 16
#macro ANIM_DEAD 17
#macro ANIM_SPELL_HEAL 18
#macro ANIM_SPELL_FIREBALL 19
#macro ANIM_SPELL_STUN 20
#macro ANIM_SPELL_CORRUPT 21
#macro TEXT 22
#macro STORE 23












