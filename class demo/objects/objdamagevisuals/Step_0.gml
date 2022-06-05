

dmg_timer++;

if (dmg_timer >= dmg_anim_dur)
{
	y -= 2;
	alpha -= 0.1;
	dmg_timer = 0;
}


if (alpha <= 0)
{
	instance_destroy();
}

