if instance_exists(sys_particle)
{
    part_system_automatic_update(sys_particle.p_system, 0)
    part_system_automatic_draw(sys_particle.p_system, 0);
    part_system_automatic_update(sys_particle.p_system_up, 0)
    part_system_automatic_draw(sys_particle.p_system_up, 0);
}
