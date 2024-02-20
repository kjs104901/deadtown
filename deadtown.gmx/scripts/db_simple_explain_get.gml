/// (target_inven,index)
var str;
str = ""
switch(argument0)
{
    case global.inven_weapon:
        str += string_trim_auto(lang_get(global.weapon_db[argument1,3]))
    break;
    case global.inven_equip:
        str += string_trim_auto(lang_get(global.equip_db[argument1,3]))
    break;
    case global.inven_use:
        str += string_trim_auto(lang_get(global.use_db[argument1,2]))
    break;
    case global.inven_etc:
        str += string_trim_auto(lang_get(global.etc_db[argument1,2]))
    break;
}

return str;
