//draw_set_colour(c_black)
var t_color = draw_get_colour()

draw_set_colour(c_black)
for (var i=0; i<8; i++)
{
    draw_text_transformed(argument0+lengthdir_x(3, (360/8)*i),argument1+lengthdir_y(3, (360/8)*i),argument2,argument3,argument4,argument5)
}

draw_set_colour(t_color)
draw_text_transformed(argument0,argument1,argument2,argument3,argument4,argument5)
