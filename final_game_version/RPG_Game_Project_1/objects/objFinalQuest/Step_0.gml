/// @description Insert description here
// You can write your code in this editor

if not instance_exists(objBattleSpawner)
{
	global.finishedRoom1 = true; 
	
	with(objNPC_Boss)
    {
        instance_destroy();
    }
}
