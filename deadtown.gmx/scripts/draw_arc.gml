var xx = argument0;
var yy = argument1;
var r = argument2;
var angle = argument3;
var angle_range = argument4;
var w = argument5;

var gap = 2;

var tx1, ty1, tx2, ty2;

var num = floor(angle_range/gap)

for(var i=0; i<num; i++)
{
    tx1 = xx + lengthdir_x(r,angle-angle_range/2+gap*i)
    ty1 = yy + lengthdir_y(r,angle-angle_range/2+gap*i)
    
    tx2 = xx + lengthdir_x(r,angle-angle_range/2+gap*i+gap)
    ty2 = yy + lengthdir_y(r,angle-angle_range/2+gap*i+gap)
    
    draw_line_width(tx1,ty1,tx2,ty2,w)
}

tx1 = xx + lengthdir_x(r,angle+angle_range/2)
ty1 = yy + lengthdir_y(r,angle+angle_range/2)

draw_line_width(tx2,ty2,tx1,ty1,w)
