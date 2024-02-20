//draw_set_colour(c_black)
var t_color = draw_get_colour()

draw_set_colour(c_black)
for (var i=0; i<16; i++)
{
    draw_text_transformed(argument0+lengthdir_x(4, (360/16)*i),argument1+lengthdir_y(4, (360/16)*i),argument2,argument3,argument4,argument5)
}

draw_set_colour(t_color)
draw_text_transformed(argument0,argument1,argument2,argument3,argument4,argument5)
