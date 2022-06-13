
function ScriptRewardBattle(){
	for (var p=0 ; p < array_length(global_arr_players) ; p++)
	{
		for (var n=0 ; n < array_length(global_spawner_units) ; n++)
		{
			global_arr_players[p, EXP] += global_spawner_units[n, EXP];
		}	
	}
	global.purse += 25;
}