draw_set_color(ui_color_info)
draw_set_alpha(ui_alpha_info)
draw_rectangle(x_center+ui_info_sx,y_center+ui_info_sy,x_center+ui_info_ex,y_center+(ui_info_sy+ui_info_ey)/2,0)

draw_set_color(ui_color_info_box)
draw_set_alpha(1)

bh = ui_info_box_height
draw_rectangle(x_center+ui_info1_x-bh,y_center+ui_info1_y-bh*2,x_center+ui_info1_x+bh,y_center+ui_info1_y,0)

