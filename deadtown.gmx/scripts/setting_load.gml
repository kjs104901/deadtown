var ratio;

ini_open("setting.ini")
if (ini_read_real("setting","check",0))
{
    global.setting_sound_effect = ini_read_real("sound","effect",0.5)
    global.setting_bgm = ini_read_real("sound","bgm",0.5)
    
    global.setting_ui = ini_read_real("ui","size",0.5)
    
    global.setting_left_size = ini_read_real("left","size",0.5)
    global.setting_left_pos = ini_read_real("left","pos",0.5)
    
    global.setting_left_relative = ini_read_real("left","relative",1)
    
    global.setting_right_size = ini_read_real("right","size",0.5)
    global.setting_right_pos = ini_read_real("right","pos",0.5)
    
    global.setting_lang = ini_read_real("lang","type",0)
    lang_type_set(global.setting_lang); 
}
else // new
{
    global.setting_sound_effect = 0.5
    global.setting_bgm = 0.5
    
    ratio = display_get_width()/1334;
    
    global.setting_ui = 0.5 * ratio
    
    global.setting_left_size = 0.5 * ratio
    global.setting_left_pos = 0.5 * ratio
    
    global.setting_left_relative = 1
    
    global.setting_right_size = 0.5 * ratio
    global.setting_right_pos = 0.5 * ratio
    
    switch(os_get_language())
    {
        case "en": global.setting_lang = 0; break;
        case "kr": global.setting_lang = 1; break;
        default: global.setting_lang = 0; break;
    }
    lang_type_set(global.setting_lang); 
}
ini_close()
