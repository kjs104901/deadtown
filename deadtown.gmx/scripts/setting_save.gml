ini_open("setting.ini")

ini_write_real("setting","check",1)

ini_write_real("sound","effect",global.setting_sound_effect)
ini_write_real("sound","bgm",global.setting_bgm)

ini_write_real("ui","size",global.setting_ui)

ini_write_real("left","size",global.setting_left_size)
ini_write_real("left","pos",global.setting_left_pos)

ini_write_real("left","relative",global.setting_left_relative)

ini_write_real("right","size",global.setting_right_size)
ini_write_real("right","pos",global.setting_right_pos)

ini_write_real("lang","type",global.setting_lang)

ini_close()
