global.tip_str = ""
for (i=0; i<global.tip_number; i++)
{
    global.tip_str += global.tip_info[i,lang_type_get()] + " / "
}

draw_set_font(font_24)
global.tip_w = string_width(global.tip_str)
