
if (!move)
{
	a = (-lifespan + MAX_LIFE) * ALPHA_MULT;

	draw_sprite_ext(sprite_index,0,x,y,1,1,image_angle,-1,a*(1/255));

	lifespan++;
}