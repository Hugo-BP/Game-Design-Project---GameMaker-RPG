if (state != STAND_BY)
{
	if (ds_exists(ds_players, ds_type_list))
	{
		ds_list_destroy(ds_players);
		ds_players = -1;
	}
	if (ds_exists(ds_npcs, ds_type_list))
	{
		ds_list_destroy(ds_npcs);
		ds_npcs = -1;
	}
	if (ds_exists(ds_selectable_npc, ds_type_list))
	{
		ds_list_destroy(ds_selectable_npc);
		ds_selectable_npc = -1;
	}
	if (ds_exists(ds_selectable_player, ds_type_list))
	{
		ds_list_destroy(ds_selectable_player);
		ds_selectable_player = -1;
	}
	if (ds_exists(ds_spellbook, ds_type_list))
	{
		ds_list_destroy(ds_spellbook);
		ds_spellbook = -1;
	}
}





