// useless

if not instance_exists(objBattleSpawner) or not instance_exists(objNPC_Boss)
{
	show_debug_message("boss dead")
	global.finishedRoom1 = true; 
	
	with(objNPC_Boss)
    {
        instance_destroy();
    }
}
