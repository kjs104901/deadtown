//spr_line
var a = argument4
var scale = point_distance(argument0,argument1,argument2,argument3)/30
var ang = point_direction(argument0,argument1,argument2,argument3)

draw_sprite_ext(spr_line,0,argument0,argument1,scale,1,ang,c_white,1)
