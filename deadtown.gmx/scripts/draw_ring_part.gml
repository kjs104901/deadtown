///draw_ring_part(x,y,vertex,distance1,distance2,angle1,angle2)
var i;
var gap = abs(angle_difference(argument5,argument6));
var num = floor(gap/argument2);
var x1;
var y1;
var x2;
var y2;

draw_primitive_begin(pr_trianglestrip)
for(i=0;i<num;i++)
{
    x1 = argument0+lengthdir_x(argument3,argument5+(argument6-argument5)*i/num)
    y1 = argument1+lengthdir_x(argument3,argument5+(argument6-argument5)*i/num)
    x2 = argument0+lengthdir_x(argument4,argument5+(argument6-argument5)*i/num)
    y2 = argument1+lengthdir_x(argument4,argument5+(argument6-argument5)*i/num)
    draw_vertex(x1, y1)
    draw_vertex(x2, y2)
}
x1 = argument0+lengthdir_x(argument3,argument6)
y1 = argument1+lengthdir_x(argument3,argument6)
x2 = argument0+lengthdir_x(argument4,argument6)
y2 = argument1+lengthdir_x(argument4,argument6)

draw_vertex(x1, y1)
draw_vertex(x2, y2)
    
draw_primitive_end();

