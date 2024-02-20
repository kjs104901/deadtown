var p_type = argument0;
var xx = argument1;
var yy = argument2;
var dir = argument3;
var num = argument4;

part_emitter_region(sys_particle.p_system_up, sys_particle.p_emitter_up, x-3, x+3, y-3, y+3, ps_shape_ellipse, ps_distr_gaussian);
part_type_direction(sys_particle.p_type, dir+180-30, dir+180+30, 0, 0);
part_emitter_burst(sys_particle.p_system_up, sys_particle.p_emitter_up, p_type, num);

