
globalvar global_arr_players, global_arr_friendlies, global_arr_enemies, global_spawner_units,
globalvar global_arr_inv, global_arr_spellbook;

// PLAYER PURSE
global.purse = 0;
global.active_quest = noone;
global.first_quest = true;
global.party_leader = 0; // changes active player sprite to his chosen party member
global.gameover = false;

// WARPING
global.player_just_warped = false;
global.finishedRoom0 = false;
global.finishedRoom1 = false;
global.warp_destination = Room_0;
global.player_prev_room = Room_0;

// COMBAT
global.player_x_before_battle = 120;
global.player_y_before_battle = 310;
global.player_warp_to_x = global.player_x_before_battle;
global.player_warp_to_y = global.player_y_before_battle;
global.curr_active_battle_spawn = noone;
global.player_menu_text[0] = "CONTINUE";
global.player_menu_text[1] = "LOAD GAME";
global.player_menu_text[2] = "NEW GAME";
global.player_menu_text[3] = "SETTINGS";
global.player_menu_text[4] = "EXIT";
global.player_menu_state = false;
global.gameover_menu_state = false;


#region Items
// ITEMS & INVENTORY
global.inventory_slots = 36;
global.inventory = noone;

// equipping items
enum equip_slot
{
	head,
	torso, 
	legs, 
	boots, 
	gloves, 
	cape, 
	left_hand, 
	right_hand,
	neck, 
	amulet, 
	tool, 
	none // cant equip this item
}

// item init
enum item_stats
{
	item_id,
	item_name,
	item_value,
	item_class,  // atk def heal miscellaneous
	item_str,
	item_equip,
	item_charges,
	item_stackable, // if you can have more than 1 per inv slot, ex. vs charges, if you got arrows you'd stack them all but they have 1 charge, a magic wand has 100 charges but if you get another one you want to put it in a separate inventory slot
	item_lvl,    // level requirement
	item_skill,  // skill to use item (ex. farming, woodcutting, mining, etc)
	item_examine // examine text
}
enum item_class
{
	equip,
	consumable, // resources can consume right away
	primary,    // resources can consume after refining
	secondary,  // resources cant consume ever, used for refining
	tool
}

// item created items
enum items
{
	fruit_apple,
	pot_hp_pot,
	pot_ap_pot,
	key,
	fruit_orange,
	fruit_lemon,
	produce_grain,
	produce_malt,
	produce_grapes,
	ore_copper,
	ore_iron,
	ore_coal,
	refined_copper_bar,
	refined_iron_bar,
	refined_steel_bar,
	wood_oak,
	wood_willow,
	wood_maple,
	fish_sardine,
	fish_trout,
	fish_salmon,
	meat_hare,
	meat_chicken,
	meat_deer,
	tool_axe,
	tool_pickaxe,
	tool_fishing_rod,
	tool_knife,
	tool_hammer,
	tool_saw,
	tool_pot,
	tool_tinderbox,
	tool_vial,
	herb_maple,
	herb_glace,
	herb_grim,
	sec_newts_eye,
	sec_ivy_leaf,
	sec_spider_legs,
	
	pot_elixir,
	consumable_bread,
	consumable_beer,
	consumable_wine,
	consumable_cooked_sardine,
	consumable_cooked_trout,
	consumable_cooked_salmon,
	consumable_cooked_hare,
	consumable_cooked_chicken,
	consumable_cooked_deer,
	
	head_leather,
	head_iron,
	head_steel,
	torso_leather,
	torso_iron,
	torso_steel,
	legs_leather,
	legs_iron,
	legs_steel,
	boots_leather,
	boots_iron,
	boots_steel,
	gloves_leather,
	gloves_iron,
	gloves_steel,
	cape_red_cape,
	cape_warm_cape,
	cape_cloak,
	right_club,
	right_copper_sword,
	right_iron_sword,
	right_steel_sword,
	right_oak_bow,
	right_willow_bow,
	right_maple_bow,
	right_wooden_staff,
	right_faery_wand,
	right_demonic_staff,
	left_wooden_shield,
	left_iron_shield,
	left_steel_shield,
	neck_copper_trinket,
	neck_ruby,
	neck_sapphire,
	amulet_good_luck_charm,
	amulet_protection_charm,
	amulet_eagle_eye_charm
}

global.item_arr[items.key, item_stats.item_id] = items.key;
global.item_arr[items.key, item_stats.item_name] = "Brass Key";
global.item_arr[items.key, item_stats.item_value] = 0;
global.item_arr[items.key, item_stats.item_class] = item_class.tool;
global.item_arr[items.key, item_stats.item_str] = 0;
global.item_arr[items.key, item_stats.item_equip] = equip_slot.none;
global.item_arr[items.key, item_stats.item_charges] = 1;

global.item_arr[items.fruit_apple, item_stats.item_id] = items.fruit_apple;
global.item_arr[items.fruit_apple, item_stats.item_name] = "Apple";
global.item_arr[items.fruit_apple, item_stats.item_value] = 3;
global.item_arr[items.fruit_apple, item_stats.item_class] = item_class.consumable;
global.item_arr[items.fruit_apple, item_stats.item_str] = 10;
global.item_arr[items.fruit_apple, item_stats.item_equip] = equip_slot.none;
global.item_arr[items.fruit_apple, item_stats.item_charges] = 1;

global.item_arr[items.fruit_orange, item_stats.item_id] = items.fruit_orange;
global.item_arr[items.fruit_orange, item_stats.item_name] = "Orange";
global.item_arr[items.fruit_orange, item_stats.item_value] = 3;
global.item_arr[items.fruit_orange, item_stats.item_class] = item_class.consumable;
global.item_arr[items.fruit_orange, item_stats.item_str] = 10;
global.item_arr[items.fruit_orange, item_stats.item_equip] = equip_slot.none;
global.item_arr[items.fruit_orange, item_stats.item_charges] = 1;

global.item_arr[items.fruit_lemon, item_stats.item_id] = items.fruit_lemon;
global.item_arr[items.fruit_lemon, item_stats.item_name] = "Lemon";
global.item_arr[items.fruit_lemon, item_stats.item_value] = 3;
global.item_arr[items.fruit_lemon, item_stats.item_class] = item_class.primary;
global.item_arr[items.fruit_lemon, item_stats.item_str] = 10;
global.item_arr[items.fruit_lemon, item_stats.item_equip] = equip_slot.none;
global.item_arr[items.fruit_lemon, item_stats.item_charges] = 1;

global.item_arr[items.produce_grain, item_stats.item_id] = items.produce_grain;
global.item_arr[items.produce_grain, item_stats.item_name] = "Grain";
global.item_arr[items.produce_grain, item_stats.item_value] = 10;
global.item_arr[items.produce_grain, item_stats.item_class] = item_class.primary;
global.item_arr[items.produce_grain, item_stats.item_str] = -1;
global.item_arr[items.produce_grain, item_stats.item_equip] = equip_slot.none;
global.item_arr[items.produce_grain, item_stats.item_charges] = 1;

global.item_arr[items.produce_malt, item_stats.item_id] = items.produce_malt;
global.item_arr[items.produce_malt, item_stats.item_name] = "Malt";
global.item_arr[items.produce_malt, item_stats.item_value] = 10;
global.item_arr[items.produce_malt, item_stats.item_class] = item_class.primary;
global.item_arr[items.produce_malt, item_stats.item_str] = -1;
global.item_arr[items.produce_malt, item_stats.item_equip] = equip_slot.none;
global.item_arr[items.produce_malt, item_stats.item_charges] = 1;

global.item_arr[items.produce_grapes, item_stats.item_id] = items.produce_grapes;
global.item_arr[items.produce_grapes, item_stats.item_name] = "Grapes";
global.item_arr[items.produce_grapes, item_stats.item_value] = 15;
global.item_arr[items.produce_grapes, item_stats.item_class] = item_class.consumable;
global.item_arr[items.produce_grapes, item_stats.item_str] = 10;
global.item_arr[items.produce_grapes, item_stats.item_equip] = equip_slot.none;
global.item_arr[items.produce_grapes, item_stats.item_charges] = 1;

global.item_arr[items.consumable_bread, item_stats.item_id] = items.consumable_bread;
global.item_arr[items.consumable_bread, item_stats.item_name] = "Loaf of Bread";
global.item_arr[items.consumable_bread, item_stats.item_value] = 15;
global.item_arr[items.consumable_bread, item_stats.item_class] = item_class.consumable;
global.item_arr[items.consumable_bread, item_stats.item_str] = 30;
global.item_arr[items.consumable_bread, item_stats.item_equip] = equip_slot.none;
global.item_arr[items.consumable_bread, item_stats.item_charges] = 1;

global.item_arr[items.consumable_beer, item_stats.item_id] = items.consumable_beer;
global.item_arr[items.consumable_beer, item_stats.item_name] = "Beer";
global.item_arr[items.consumable_beer, item_stats.item_value] = 20;
global.item_arr[items.consumable_beer, item_stats.item_class] = item_class.consumable;
global.item_arr[items.consumable_beer, item_stats.item_str] = 10;
global.item_arr[items.consumable_beer, item_stats.item_equip] = equip_slot.none;
global.item_arr[items.consumable_beer, item_stats.item_charges] = 1;

global.item_arr[items.consumable_wine, item_stats.item_id] = items.consumable_wine;
global.item_arr[items.consumable_wine, item_stats.item_name] = "Wine";
global.item_arr[items.consumable_wine, item_stats.item_value] = 30;
global.item_arr[items.consumable_wine, item_stats.item_class] = item_class.consumable;
global.item_arr[items.consumable_wine, item_stats.item_str] = 10;
global.item_arr[items.consumable_wine, item_stats.item_equip] = equip_slot.none;
global.item_arr[items.consumable_wine, item_stats.item_charges] = 1;



global.item_arr[items.ore_copper, item_stats.item_id] = items.ore_copper;
global.item_arr[items.ore_copper, item_stats.item_name] = "Copper Ore";
global.item_arr[items.ore_copper, item_stats.item_value] = 4;
global.item_arr[items.ore_copper, item_stats.item_class] = item_class.primary;
global.item_arr[items.ore_copper, item_stats.item_str] = -1;
global.item_arr[items.ore_copper, item_stats.item_equip] = equip_slot.none;
global.item_arr[items.ore_copper, item_stats.item_charges] = 1;

global.item_arr[items.ore_iron, item_stats.item_id] = items.ore_iron;
global.item_arr[items.ore_iron, item_stats.item_name] = "Iron Ore";
global.item_arr[items.ore_iron, item_stats.item_value] = 9;
global.item_arr[items.ore_iron, item_stats.item_class] = item_class.primary;
global.item_arr[items.ore_iron, item_stats.item_str] = -1;
global.item_arr[items.ore_iron, item_stats.item_equip] = equip_slot.none;
global.item_arr[items.ore_iron, item_stats.item_charges] = 1;

global.item_arr[items.ore_coal, item_stats.item_id] = items.ore_coal;
global.item_arr[items.ore_coal, item_stats.item_name] = "Coal";
global.item_arr[items.ore_coal, item_stats.item_value] = 6;
global.item_arr[items.ore_coal, item_stats.item_class] = item_class.secondary;
global.item_arr[items.ore_coal, item_stats.item_str] = -1;
global.item_arr[items.ore_coal, item_stats.item_equip] = equip_slot.none;
global.item_arr[items.ore_coal, item_stats.item_charges] = 1;

global.item_arr[items.refined_copper_bar, item_stats.item_id] = items.refined_copper_bar;
global.item_arr[items.refined_copper_bar, item_stats.item_name] = "Copper Bar";
global.item_arr[items.refined_copper_bar, item_stats.item_value] = 8;
global.item_arr[items.refined_copper_bar, item_stats.item_class] = item_class.primary;
global.item_arr[items.refined_copper_bar, item_stats.item_str] = -1;
global.item_arr[items.refined_copper_bar, item_stats.item_equip] = equip_slot.none;
global.item_arr[items.refined_copper_bar, item_stats.item_charges] = 1;

global.item_arr[items.refined_iron_bar, item_stats.item_id] = items.refined_iron_bar;
global.item_arr[items.refined_iron_bar, item_stats.item_name] = "Iron Bar";
global.item_arr[items.refined_iron_bar, item_stats.item_value] = 18;
global.item_arr[items.refined_iron_bar, item_stats.item_class] = item_class.primary;
global.item_arr[items.refined_iron_bar, item_stats.item_str] = -1;
global.item_arr[items.refined_iron_bar, item_stats.item_equip] = equip_slot.none;
global.item_arr[items.refined_iron_bar, item_stats.item_charges] = 1;

global.item_arr[items.refined_steel_bar, item_stats.item_id] = items.refined_steel_bar;
global.item_arr[items.refined_steel_bar, item_stats.item_name] = "Steel Bar";
global.item_arr[items.refined_steel_bar, item_stats.item_value] = 30;
global.item_arr[items.refined_steel_bar, item_stats.item_class] = item_class.primary;
global.item_arr[items.refined_steel_bar, item_stats.item_str] = -1;
global.item_arr[items.refined_steel_bar, item_stats.item_equip] = equip_slot.none;
global.item_arr[items.refined_steel_bar, item_stats.item_charges] = 1;



global.item_arr[items.wood_oak, item_stats.item_id] = items.wood_oak;
global.item_arr[items.wood_oak, item_stats.item_name] = "Oak Logs";
global.item_arr[items.wood_oak, item_stats.item_value] = 3;
global.item_arr[items.wood_oak, item_stats.item_class] = item_class.primary;
global.item_arr[items.wood_oak, item_stats.item_str] = -1;
global.item_arr[items.wood_oak, item_stats.item_equip] = equip_slot.none;
global.item_arr[items.wood_oak, item_stats.item_charges] = 1;

global.item_arr[items.wood_willow, item_stats.item_id] = items.wood_willow;
global.item_arr[items.wood_willow, item_stats.item_name] = "Willow Logs";
global.item_arr[items.wood_willow, item_stats.item_value] = 6;
global.item_arr[items.wood_willow, item_stats.item_class] = item_class.primary;
global.item_arr[items.wood_willow, item_stats.item_str] = -1;
global.item_arr[items.wood_willow, item_stats.item_equip] = equip_slot.none;
global.item_arr[items.wood_willow, item_stats.item_charges] = 1;

global.item_arr[items.wood_maple, item_stats.item_id] = items.wood_maple;
global.item_arr[items.wood_maple, item_stats.item_name] = "Maple Logs";
global.item_arr[items.wood_maple, item_stats.item_value] = 12;
global.item_arr[items.wood_maple, item_stats.item_class] = item_class.primary;
global.item_arr[items.wood_maple, item_stats.item_str] = -1;
global.item_arr[items.wood_maple, item_stats.item_equip] = equip_slot.none;
global.item_arr[items.wood_maple, item_stats.item_charges] = 1;



global.item_arr[items.fish_sardine, item_stats.item_id] = items.fish_sardine;
global.item_arr[items.fish_sardine, item_stats.item_name] = "Raw Sardine";
global.item_arr[items.fish_sardine, item_stats.item_value] = 4;
global.item_arr[items.fish_sardine, item_stats.item_class] = item_class.primary;
global.item_arr[items.fish_sardine, item_stats.item_str] = -1;
global.item_arr[items.fish_sardine, item_stats.item_equip] = equip_slot.none;
global.item_arr[items.fish_sardine, item_stats.item_charges] = 1;

global.item_arr[items.fish_trout, item_stats.item_id] = items.fish_trout;
global.item_arr[items.fish_trout, item_stats.item_name] = "Raw Trout";
global.item_arr[items.fish_trout, item_stats.item_value] = 8;
global.item_arr[items.fish_trout, item_stats.item_class] = item_class.primary;
global.item_arr[items.fish_trout, item_stats.item_str] = -1;
global.item_arr[items.fish_trout, item_stats.item_equip] = equip_slot.none;
global.item_arr[items.fish_trout, item_stats.item_charges] = 1;

global.item_arr[items.fish_salmon, item_stats.item_id] = items.fish_salmon;
global.item_arr[items.fish_salmon, item_stats.item_name] = "Raw Salmon";
global.item_arr[items.fish_salmon, item_stats.item_value] = 16;
global.item_arr[items.fish_salmon, item_stats.item_class] = item_class.primary;
global.item_arr[items.fish_salmon, item_stats.item_str] = -1;
global.item_arr[items.fish_salmon, item_stats.item_equip] = equip_slot.none;
global.item_arr[items.fish_salmon, item_stats.item_charges] = 1;

global.item_arr[items.meat_hare, item_stats.item_id] = items.meat_hare;
global.item_arr[items.meat_hare, item_stats.item_name] = "Raw Hare";
global.item_arr[items.meat_hare, item_stats.item_value] = 16;
global.item_arr[items.meat_hare, item_stats.item_class] = item_class.primary;
global.item_arr[items.meat_hare, item_stats.item_str] = -1;
global.item_arr[items.meat_hare, item_stats.item_equip] = equip_slot.none;
global.item_arr[items.meat_hare, item_stats.item_charges] = 1;

global.item_arr[items.meat_chicken, item_stats.item_id] = items.meat_chicken;
global.item_arr[items.meat_chicken, item_stats.item_name] = "Raw Chicken";
global.item_arr[items.meat_chicken, item_stats.item_value] = 8;
global.item_arr[items.meat_chicken, item_stats.item_class] = item_class.primary;
global.item_arr[items.meat_chicken, item_stats.item_str] = -1;
global.item_arr[items.meat_chicken, item_stats.item_equip] = equip_slot.none;
global.item_arr[items.meat_chicken, item_stats.item_charges] = 1;

global.item_arr[items.meat_deer, item_stats.item_id] = items.meat_deer;
global.item_arr[items.meat_deer, item_stats.item_name] = "Raw Deer";
global.item_arr[items.meat_deer, item_stats.item_value] = 40;
global.item_arr[items.meat_deer, item_stats.item_class] = item_class.primary;
global.item_arr[items.meat_deer, item_stats.item_str] = -1;
global.item_arr[items.meat_deer, item_stats.item_equip] = equip_slot.none;
global.item_arr[items.meat_deer, item_stats.item_charges] = 1;

global.item_arr[items.consumable_cooked_sardine, item_stats.item_id] = items.consumable_cooked_sardine;
global.item_arr[items.consumable_cooked_sardine, item_stats.item_name] = "Sardine";
global.item_arr[items.consumable_cooked_sardine, item_stats.item_value] = 12;
global.item_arr[items.consumable_cooked_sardine, item_stats.item_class] = item_class.consumable;
global.item_arr[items.consumable_cooked_sardine, item_stats.item_str] = 10;
global.item_arr[items.consumable_cooked_sardine, item_stats.item_equip] = equip_slot.none;
global.item_arr[items.consumable_cooked_sardine, item_stats.item_charges] = 1;

global.item_arr[items.consumable_cooked_trout, item_stats.item_id] = items.consumable_cooked_trout;
global.item_arr[items.consumable_cooked_trout, item_stats.item_name] = "Trout";
global.item_arr[items.consumable_cooked_trout, item_stats.item_value] = 24;
global.item_arr[items.consumable_cooked_trout, item_stats.item_class] = item_class.consumable;
global.item_arr[items.consumable_cooked_trout, item_stats.item_str] = 30;
global.item_arr[items.consumable_cooked_trout, item_stats.item_equip] = equip_slot.none;
global.item_arr[items.consumable_cooked_trout, item_stats.item_charges] = 1;

global.item_arr[items.consumable_cooked_salmon, item_stats.item_id] = items.consumable_cooked_salmon;
global.item_arr[items.consumable_cooked_salmon, item_stats.item_name] = "Salmon";
global.item_arr[items.consumable_cooked_salmon, item_stats.item_value] = 48;
global.item_arr[items.consumable_cooked_salmon, item_stats.item_class] = item_class.consumable;
global.item_arr[items.consumable_cooked_salmon, item_stats.item_str] = 50;
global.item_arr[items.consumable_cooked_salmon, item_stats.item_equip] = equip_slot.none;
global.item_arr[items.consumable_cooked_salmon, item_stats.item_charges] = 1;

global.item_arr[items.consumable_cooked_chicken, item_stats.item_id] = items.consumable_cooked_chicken;
global.item_arr[items.consumable_cooked_chicken, item_stats.item_name] = "Chicken";
global.item_arr[items.consumable_cooked_chicken, item_stats.item_value] = 12;
global.item_arr[items.consumable_cooked_chicken, item_stats.item_class] = item_class.consumable;
global.item_arr[items.consumable_cooked_chicken, item_stats.item_str] = 10;
global.item_arr[items.consumable_cooked_chicken, item_stats.item_equip] = equip_slot.none;
global.item_arr[items.consumable_cooked_chicken, item_stats.item_charges] = 1;

global.item_arr[items.consumable_cooked_hare, item_stats.item_id] = items.consumable_cooked_hare;
global.item_arr[items.consumable_cooked_hare, item_stats.item_name] = "Hare";
global.item_arr[items.consumable_cooked_hare, item_stats.item_value] = 24;
global.item_arr[items.consumable_cooked_hare, item_stats.item_class] = item_class.consumable;
global.item_arr[items.consumable_cooked_hare, item_stats.item_str] = 30;
global.item_arr[items.consumable_cooked_hare, item_stats.item_equip] = equip_slot.none;
global.item_arr[items.consumable_cooked_hare, item_stats.item_charges] = 1;

global.item_arr[items.consumable_cooked_deer, item_stats.item_id] = items.consumable_cooked_deer;
global.item_arr[items.consumable_cooked_deer, item_stats.item_name] = "Salmon";
global.item_arr[items.consumable_cooked_deer, item_stats.item_value] = 48;
global.item_arr[items.consumable_cooked_deer, item_stats.item_class] = item_class.consumable;
global.item_arr[items.consumable_cooked_deer, item_stats.item_str] = 50;
global.item_arr[items.consumable_cooked_deer, item_stats.item_equip] = equip_slot.none;
global.item_arr[items.consumable_cooked_deer, item_stats.item_charges] = 1;



global.item_arr[items.herb_maple, item_stats.item_id] = items.herb_maple;
global.item_arr[items.herb_maple, item_stats.item_name] = "Maple Herb";
global.item_arr[items.herb_maple, item_stats.item_value] = 15;
global.item_arr[items.herb_maple, item_stats.item_class] = item_class.primary;
global.item_arr[items.herb_maple, item_stats.item_str] = -1;
global.item_arr[items.herb_maple, item_stats.item_equip] = equip_slot.none;
global.item_arr[items.herb_maple, item_stats.item_charges] = 1;

global.item_arr[items.herb_glace, item_stats.item_id] = items.herb_glace;
global.item_arr[items.herb_glace, item_stats.item_name] = "Glaces Herb";
global.item_arr[items.herb_glace, item_stats.item_value] = 30;
global.item_arr[items.herb_glace, item_stats.item_class] = item_class.primary;
global.item_arr[items.herb_glace, item_stats.item_str] = -1;
global.item_arr[items.herb_glace, item_stats.item_equip] = equip_slot.none;
global.item_arr[items.herb_glace, item_stats.item_charges] = 1;

global.item_arr[items.herb_grim, item_stats.item_id] = items.herb_grim;
global.item_arr[items.herb_grim, item_stats.item_name] = "Grim Herb";
global.item_arr[items.herb_grim, item_stats.item_value] = 60;
global.item_arr[items.herb_grim, item_stats.item_class] = item_class.primary;
global.item_arr[items.herb_grim, item_stats.item_str] = -1;
global.item_arr[items.herb_grim, item_stats.item_equip] = equip_slot.none;
global.item_arr[items.herb_grim, item_stats.item_charges] = 1;

global.item_arr[items.sec_newts_eye, item_stats.item_id] = items.sec_newts_eye;
global.item_arr[items.sec_newts_eye, item_stats.item_name] = "Eye of Newt";
global.item_arr[items.sec_newts_eye, item_stats.item_value] = 3;
global.item_arr[items.sec_newts_eye, item_stats.item_class] = item_class.secondary;
global.item_arr[items.sec_newts_eye, item_stats.item_str] = -1;
global.item_arr[items.sec_newts_eye, item_stats.item_equip] = equip_slot.none;
global.item_arr[items.sec_newts_eye, item_stats.item_charges] = 1;

global.item_arr[items.sec_ivy_leaf, item_stats.item_id] = items.sec_ivy_leaf;
global.item_arr[items.sec_ivy_leaf, item_stats.item_name] = "Ivy Leaf";
global.item_arr[items.sec_ivy_leaf, item_stats.item_value] = 3;
global.item_arr[items.sec_ivy_leaf, item_stats.item_class] = item_class.secondary;
global.item_arr[items.sec_ivy_leaf, item_stats.item_str] = -1;
global.item_arr[items.sec_ivy_leaf, item_stats.item_equip] = equip_slot.none;
global.item_arr[items.sec_ivy_leaf, item_stats.item_charges] = 1;

global.item_arr[items.sec_spider_legs, item_stats.item_id] = items.sec_spider_legs;
global.item_arr[items.sec_spider_legs, item_stats.item_name] = "Spider Legs";
global.item_arr[items.sec_spider_legs, item_stats.item_value] = 3;
global.item_arr[items.sec_spider_legs, item_stats.item_class] = item_class.secondary;
global.item_arr[items.sec_spider_legs, item_stats.item_str] = -1;
global.item_arr[items.sec_spider_legs, item_stats.item_equip] = equip_slot.none;
global.item_arr[items.sec_spider_legs, item_stats.item_charges] = 1;

global.item_arr[items.pot_hp_pot, item_stats.item_id] = items.pot_hp_pot;
global.item_arr[items.pot_hp_pot, item_stats.item_name] = "HP Potion";
global.item_arr[items.pot_hp_pot, item_stats.item_value] = 100;
global.item_arr[items.pot_hp_pot, item_stats.item_class] = item_class.consumable;
global.item_arr[items.pot_hp_pot, item_stats.item_str] = 50;
global.item_arr[items.pot_hp_pot, item_stats.item_equip] = equip_slot.none;
global.item_arr[items.pot_hp_pot, item_stats.item_charges] = 1;

global.item_arr[items.pot_ap_pot, item_stats.item_id] = items.pot_ap_pot;
global.item_arr[items.pot_ap_pot, item_stats.item_name] = "AP Potion";
global.item_arr[items.pot_ap_pot, item_stats.item_value] = 100;
global.item_arr[items.pot_ap_pot, item_stats.item_class] = item_class.consumable;
global.item_arr[items.pot_ap_pot, item_stats.item_str] = 50;
global.item_arr[items.pot_ap_pot, item_stats.item_equip] = equip_slot.none;
global.item_arr[items.pot_ap_pot, item_stats.item_charges] = 1;

global.item_arr[items.pot_elixir, item_stats.item_id] = items.pot_elixir;
global.item_arr[items.pot_elixir, item_stats.item_name] = "Elixir";
global.item_arr[items.pot_elixir, item_stats.item_value] = 300;
global.item_arr[items.pot_elixir, item_stats.item_class] = item_class.consumable;
global.item_arr[items.pot_elixir, item_stats.item_str] = 50;
global.item_arr[items.pot_elixir, item_stats.item_equip] = equip_slot.none;
global.item_arr[items.pot_elixir, item_stats.item_charges] = 1;



global.item_arr[items.tool_axe, item_stats.item_id] = items.tool_axe;
global.item_arr[items.tool_axe, item_stats.item_name] = "Axe";
global.item_arr[items.tool_axe, item_stats.item_value] = 25;
global.item_arr[items.tool_axe, item_stats.item_class] = item_class.tool;
global.item_arr[items.tool_axe, item_stats.item_str] = -1;
global.item_arr[items.tool_axe, item_stats.item_equip] = equip_slot.tool;
global.item_arr[items.tool_axe, item_stats.item_charges] = 100;

global.item_arr[items.tool_pickaxe, item_stats.item_id] = items.tool_pickaxe;
global.item_arr[items.tool_pickaxe, item_stats.item_name] = "Pickaxe";
global.item_arr[items.tool_pickaxe, item_stats.item_value] = 25;
global.item_arr[items.tool_pickaxe, item_stats.item_class] = item_class.tool;
global.item_arr[items.tool_pickaxe, item_stats.item_str] = -1;
global.item_arr[items.tool_pickaxe, item_stats.item_equip] = equip_slot.tool;
global.item_arr[items.tool_pickaxe, item_stats.item_charges] = 100;

global.item_arr[items.tool_fishing_rod, item_stats.item_id] = items.tool_fishing_rod;
global.item_arr[items.tool_fishing_rod, item_stats.item_name] = "Fishing Rod";
global.item_arr[items.tool_fishing_rod, item_stats.item_value] = 25;
global.item_arr[items.tool_fishing_rod, item_stats.item_class] = item_class.tool;
global.item_arr[items.tool_fishing_rod, item_stats.item_str] = -1;
global.item_arr[items.tool_fishing_rod, item_stats.item_equip] = equip_slot.tool;
global.item_arr[items.tool_fishing_rod, item_stats.item_charges] = 100;

global.item_arr[items.tool_knife, item_stats.item_id] = items.tool_knife;
global.item_arr[items.tool_knife, item_stats.item_name] = "Knife";
global.item_arr[items.tool_knife, item_stats.item_value] = 25;
global.item_arr[items.tool_knife, item_stats.item_class] = item_class.tool;
global.item_arr[items.tool_knife, item_stats.item_str] = -1;
global.item_arr[items.tool_knife, item_stats.item_equip] = equip_slot.tool;
global.item_arr[items.tool_knife, item_stats.item_charges] = 100;

global.item_arr[items.tool_hammer, item_stats.item_id] = items.tool_hammer;
global.item_arr[items.tool_hammer, item_stats.item_name] = "Hammer";
global.item_arr[items.tool_hammer, item_stats.item_value] = 25;
global.item_arr[items.tool_hammer, item_stats.item_class] = item_class.tool;
global.item_arr[items.tool_hammer, item_stats.item_str] = -1;
global.item_arr[items.tool_hammer, item_stats.item_equip] = equip_slot.tool;
global.item_arr[items.tool_hammer, item_stats.item_charges] = 100;

global.item_arr[items.tool_saw, item_stats.item_id] = items.tool_saw;
global.item_arr[items.tool_saw, item_stats.item_name] = "Saw";
global.item_arr[items.tool_saw, item_stats.item_value] = 25;
global.item_arr[items.tool_saw, item_stats.item_class] = item_class.tool;
global.item_arr[items.tool_saw, item_stats.item_str] = -1;
global.item_arr[items.tool_saw, item_stats.item_equip] = equip_slot.tool;
global.item_arr[items.tool_saw, item_stats.item_charges] = 100;

global.item_arr[items.tool_pot, item_stats.item_id] = items.tool_pot;
global.item_arr[items.tool_pot, item_stats.item_name] = "Clay Pot";
global.item_arr[items.tool_pot, item_stats.item_value] = 25;
global.item_arr[items.tool_pot, item_stats.item_class] = item_class.tool;
global.item_arr[items.tool_pot, item_stats.item_str] = -1;
global.item_arr[items.tool_pot, item_stats.item_equip] = equip_slot.tool;
global.item_arr[items.tool_pot, item_stats.item_charges] = 100;

global.item_arr[items.tool_tinderbox, item_stats.item_id] = items.tool_tinderbox;
global.item_arr[items.tool_tinderbox, item_stats.item_name] = "Tinderbox";
global.item_arr[items.tool_tinderbox, item_stats.item_value] = 25;
global.item_arr[items.tool_tinderbox, item_stats.item_class] = item_class.tool;
global.item_arr[items.tool_tinderbox, item_stats.item_str] = -1;
global.item_arr[items.tool_tinderbox, item_stats.item_equip] = equip_slot.tool;
global.item_arr[items.tool_tinderbox, item_stats.item_charges] = 100;

global.item_arr[items.tool_vial, item_stats.item_id] = items.tool_vial;
global.item_arr[items.tool_vial, item_stats.item_name] = "Glass Vial";
global.item_arr[items.tool_vial, item_stats.item_value] = 5;
global.item_arr[items.tool_vial, item_stats.item_class] = item_class.tool;
global.item_arr[items.tool_vial, item_stats.item_str] = -1;
global.item_arr[items.tool_vial, item_stats.item_equip] = equip_slot.tool;
global.item_arr[items.tool_vial, item_stats.item_charges] = 1;


#endregion

// inventory init
enum item_slot
{
	item_id,		// -1 for empty slot / no item
	item_charges,	// -1 for items that dont stack
	item_amount,
	item_is_equip,	// T or F
	_end
}

for (var slot=0 ; slot < global.inventory_slots ; slot++)
{
	for (var slot_info=0 ; slot_info < item_slot._end ; slot_info++)
	{
		global.inventory[slot, slot_info] = -1;
	}
}

global.inventory[7, item_slot.item_id] = global.item_arr[items.fruit_apple, item_stats.item_id] ;
global.inventory[7, item_slot.item_charges] = 1;
global.inventory[7, item_slot.item_is_equip] = false;

global.inventory[9, item_slot.item_id] = global.item_arr[items.pot_hp_pot, item_stats.item_id] ;
global.inventory[9, item_slot.item_charges] = 1;
global.inventory[9, item_slot.item_is_equip] = false;

global.inventory[10, item_slot.item_id] = global.item_arr[items.pot_ap_pot, item_stats.item_id] ;
global.inventory[10, item_slot.item_charges] = 1;
global.inventory[10, item_slot.item_is_equip] = false;

//SPELLBOOKS
// SPELLBOOK MENU TEXT
global_arr_spellbook[HAS_SPELL_HEAL] = "HEAL";
global_arr_spellbook[HAS_SPELL_FIREBALL] = "FIREBALL";
global_arr_spellbook[HAS_SPELL_STUN] = "STUN";
global_arr_spellbook[HAS_SPELL_CORRUPT] = "CORRUPT";

//INVENTORIES
// global_arr_inv[player, inv_slot_x] = item
global_arr_inv[0,0] = "";
global_arr_inv[0,1] = "";
global_arr_inv[0,2] = global.item_arr[items.pot_hp_pot];
global_arr_inv[0,3] = "";
global_arr_inv[0,4] = "";

global_arr_inv[1,0] = "";
global_arr_inv[1,1] = global.item_arr[items.pot_hp_pot];
global_arr_inv[1,2] = global.item_arr[items.pot_hp_pot];
global_arr_inv[1,3] = "";
global_arr_inv[1,4] = "";

global_arr_inv[2,0] = global.item_arr[items.pot_ap_pot];
global_arr_inv[2,1] = "";
global_arr_inv[2,2] = "";
global_arr_inv[2,3] = global.item_arr[items.pot_hp_pot];
global_arr_inv[2,4] = "";

global_arr_inv[3,0] = global.item_arr[items.pot_hp_pot];
global_arr_inv[3,1] = global.item_arr[items.pot_ap_pot];
global_arr_inv[3,2] = global.item_arr[items.pot_hp_pot];
global_arr_inv[3,3] = "";
global_arr_inv[3,4] = "";


#region PLAYER_ARR

global.recruit_mage = false;
global.recruit_healer = false;
global.recruit_archer = false;


// PLAYERS
global_arr_players[0, NAME] = "RED";
global_arr_players[0, CLASS] = "KNIGHT";
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


if ( global.recruit_archer == true ) {
global_arr_players[1, NAME] = "GREEN";
global_arr_players[1, CLASS] = "ARCHER";
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
global_arr_players[1, ANIM_ATTACK] = sprArcherAttack;
global_arr_players[1, ANIM_DEAD] = sprDead;

}

if ( global.recruit_mage == true ) {

global_arr_players[2, NAME] = "BLUE";
global_arr_players[2, CLASS] = "MAGE";
global_arr_players[2, LEVEL] = 1;
global_arr_players[2, MAX_HP] = 100;
global_arr_players[2, CURR_HP] = 100;
global_arr_players[2, MAX_AP] = 200;
global_arr_players[2, CURR_AP] = 200;
global_arr_players[2, EXP] = 0;
global_arr_players[2, INITIATIVE] = 75;
global_arr_players[2, MAX_WEAPON_DAMAGE] = 10;
global_arr_players[2, HAS_SPELL_HEAL] = false;
global_arr_players[2, HAS_SPELL_FIREBALL] = true;
global_arr_players[2, HAS_SPELL_STUN] = true;
global_arr_players[2, HAS_SPELL_CORRUPT] = true;
global_arr_players[2, ANIM_IDLE] = sprMageIdle;
global_arr_players[2, ANIM_MOVE] = sprKnightMove;
global_arr_players[2, ANIM_ATTACK] = sprMageAttack;
global_arr_players[2, ANIM_DEAD] = sprDead;

}

if ( global.recruit_healer == true ) {
global_arr_players[3, NAME] = "YELLOW";
global_arr_players[3, CLASS] = "HEALER";
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
global_arr_players[3, ANIM_IDLE] = sprHealerIdle;
global_arr_players[3, ANIM_MOVE] = sprKnightMove;
global_arr_players[3, ANIM_ATTACK] = sprHealerAttack;
global_arr_players[3, ANIM_DEAD] = sprDead;

}

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
global_arr_enemies[enemies.skeleton_knight, CLASS] = "KNIGHT";
global_arr_enemies[enemies.skeleton_knight, LEVEL] = 8;
global_arr_enemies[enemies.skeleton_knight, MAX_HP] = 200;
global_arr_enemies[enemies.skeleton_knight, CURR_HP] = 200;
global_arr_enemies[enemies.skeleton_knight, MAX_AP] = 20;
global_arr_enemies[enemies.skeleton_knight, CURR_AP] = 20;
global_arr_enemies[enemies.skeleton_knight, EXP] = 50;
global_arr_enemies[enemies.skeleton_knight, INITIATIVE] = 100;
global_arr_enemies[enemies.skeleton_knight, MAX_WEAPON_DAMAGE] = 25;
global_arr_enemies[enemies.skeleton_knight, ANIM_IDLE] = sprSkelKnightIdle;
global_arr_enemies[enemies.skeleton_knight, ANIM_ATTACK] = sprSkelKnightAttack;
global_arr_enemies[enemies.skeleton_knight, ANIM_DEAD] = sprDead;

global_arr_enemies[enemies.skeleton_archer, NAME] = "Skeleton Archer";
global_arr_enemies[enemies.skeleton_archer, CLASS] = "ARCHER";
global_arr_enemies[enemies.skeleton_archer, LEVEL] = 8;
global_arr_enemies[enemies.skeleton_archer, MAX_HP] = 100;
global_arr_enemies[enemies.skeleton_archer, CURR_HP] = 100;
global_arr_enemies[enemies.skeleton_archer, MAX_AP] = 20;
global_arr_enemies[enemies.skeleton_archer, CURR_AP] = 20;
global_arr_enemies[enemies.skeleton_archer, EXP] = 50;
global_arr_enemies[enemies.skeleton_archer, INITIATIVE] = 100;
global_arr_enemies[enemies.skeleton_archer, MAX_WEAPON_DAMAGE] = 25;
global_arr_enemies[enemies.skeleton_archer, ANIM_IDLE] = sprSkelArcherIdle;
global_arr_enemies[enemies.skeleton_archer, ANIM_ATTACK] = sprSkelArcherAttack;
global_arr_enemies[enemies.skeleton_archer, ANIM_DEAD] = sprDead;

global_arr_enemies[enemies.demon, NAME] = "Demon";
global_arr_enemies[enemies.demon, CLASS] = "MAGE";
global_arr_enemies[enemies.demon, LEVEL] = 15;
global_arr_enemies[enemies.demon, MAX_HP] = 100;
global_arr_enemies[enemies.demon, CURR_HP] = 100;
global_arr_enemies[enemies.demon, MAX_AP] = 20;
global_arr_enemies[enemies.demon, CURR_AP] = 20;
global_arr_enemies[enemies.demon, EXP] = 100;
global_arr_enemies[enemies.demon, INITIATIVE] = 200;
global_arr_enemies[enemies.demon, MAX_WEAPON_DAMAGE] = 25;
global_arr_enemies[enemies.demon, ANIM_IDLE] = sprDemonIdle;
global_arr_enemies[enemies.demon, ANIM_ATTACK] = sprDemonAttack;
global_arr_enemies[enemies.demon, ANIM_DEAD] = sprDead;

global_arr_enemies[enemies.evil_eye, NAME] = "Evil-Eye";
global_arr_enemies[enemies.evil_eye, CLASS] = "HEALER";
global_arr_enemies[enemies.evil_eye, LEVEL] = 5;
global_arr_enemies[enemies.evil_eye, MAX_HP] = 100;
global_arr_enemies[enemies.evil_eye, CURR_HP] = 100;
global_arr_enemies[enemies.evil_eye, MAX_AP] = 20;
global_arr_enemies[enemies.evil_eye, CURR_AP] = 20;
global_arr_enemies[enemies.evil_eye, EXP] = 20;
global_arr_enemies[enemies.evil_eye, INITIATIVE] = 20;
global_arr_enemies[enemies.evil_eye, MAX_WEAPON_DAMAGE] = 25;
global_arr_enemies[enemies.evil_eye, ANIM_IDLE] = sprEvilEyeIdle;
global_arr_enemies[enemies.evil_eye, ANIM_ATTACK] = sprEvilEyeAttack;
global_arr_enemies[enemies.evil_eye, ANIM_DEAD] = sprDead;

global_arr_enemies[enemies.zombie, NAME] = "Zombie";
global_arr_enemies[enemies.zombie, CLASS] = "KNIGHT";
global_arr_enemies[enemies.zombie, LEVEL] = 8;
global_arr_enemies[enemies.zombie, MAX_HP] = 400;
global_arr_enemies[enemies.zombie, CURR_HP] = 400;
global_arr_enemies[enemies.zombie, MAX_AP] = 20;
global_arr_enemies[enemies.zombie, CURR_AP] = 20;
global_arr_enemies[enemies.zombie, EXP] = 50;
global_arr_enemies[enemies.zombie, INITIATIVE] = 1;
global_arr_enemies[enemies.zombie, MAX_WEAPON_DAMAGE] = 10;
global_arr_enemies[enemies.zombie, ANIM_IDLE] = sprZombieIdle;
global_arr_enemies[enemies.zombie, ANIM_ATTACK] = sprZombieAttack;
global_arr_enemies[enemies.zombie, ANIM_DEAD] = sprDead;


global_arr_enemies[enemies.lich, NAME] = "Lich";
global_arr_enemies[enemies.lich, CLASS] = "MAGE";
global_arr_enemies[enemies.lich, LEVEL] = 25;
global_arr_enemies[enemies.lich, MAX_HP] = 500;
global_arr_enemies[enemies.lich, CURR_HP] = 500;
global_arr_enemies[enemies.lich, MAX_AP] = 20;
global_arr_enemies[enemies.lich, CURR_AP] = 20;
global_arr_enemies[enemies.lich, EXP] = 100;
global_arr_enemies[enemies.lich, INITIATIVE] = 1000;
global_arr_enemies[enemies.lich, MAX_WEAPON_DAMAGE] = 50;
global_arr_enemies[enemies.lich, ANIM_IDLE] = sprLichIdle;
global_arr_enemies[enemies.lich, ANIM_ATTACK] = sprLichAttack;
global_arr_enemies[enemies.lich, ANIM_DEAD] = sprDead;

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













