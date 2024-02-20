///draw_ring(x,y,vertex,distance1,distance2,angle)

var x1, y1, x2, y2;
for(i=0; i<359; i+=360/argument2)
{
    x1=argument0+lengthdir_x(argument3,i+argument5);
    y1=argument1+lengthdir_y(argument3,i+argument5);
    x2=argument0+lengthdir_x(argument4,i+argument5);
    y2=argument1+lengthdir_y(argument4,i+argument5);
    draw_triangle(x1,y1,x2,y2,argument0+lengthdir_x(argument3,i-360/argument2+argument5),argument1+lengthdir_y(argument3,i-360/argument2+argument5),0);
    draw_triangle(x1,y1,x2,y2,argument0+lengthdir_x(argument4,i+360/argument2+argument5),argument1+lengthdir_y(argument4,i+360/argument2+argument5),0);
}
