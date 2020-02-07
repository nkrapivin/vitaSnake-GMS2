is_dead = (lifespan > MAX_LIFE);

if (move)
{
    x -= sin(image_angle) * PARTICLE_SPEED * 1;
    y += cos(image_angle) * PARTICLE_SPEED * 1;
    image_angle += randNotationSpeed * 1;
}

