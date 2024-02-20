instance_deactivate_object(par_action)
instance_deactivate_object(par_solid)
instance_activate_object(obj_gps)

with(sys_spawn_time_light)
{
    instance_activate_region(obj_player.x-deactive_range, obj_player.y-deactive_range, deactive_range*2, deactive_range*2, 1);
}
