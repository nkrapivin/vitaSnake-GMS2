MAX_LIFE = 40;
RAND_LIFE = 20;
ALPHA_MULT = 255 / MAX_LIFE;
PARTICLE_SPEED = 1.6;
a = 1;

randNotationSpeed = (random_range(0,32767)/32767) * 0.1;
lifespan = (random_range(0,32767) % RAND_LIFE);
move = false;
is_dead = false;