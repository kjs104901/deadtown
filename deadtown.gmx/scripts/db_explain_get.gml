/// (target_inven,index)
var str;
str = ""
switch(argument0)
{
    case global.inven_weapon:
        str += string_trim_auto(lang_get(global.weapon_db[argument1,3])) + "##"
        if global.weapon_db[argument1,4] == 7 //near
        {
            str += lang_get("Attack") + " : " + string(global.weapon_db[argument1,5]) + "#"
            str += lang_get("Rate of fire") + " : " + string(global.weapon_db[argument1,6])
        }
        else
        {
            str += lang_get("Attack") + " : " + string(global.weapon_db[argument1,5]) + "#"
            str += lang_get("Rate of fire") + " : " + string(global.weapon_db[argument1,6]) + "#"
            str += lang_get("Recoil") + " : " + string(global.weapon_db[argument1,7]) + "#"
            str += lang_get("Round") + " : " + string(global.weapon_db[argument1,8]) + "#"
            str += lang_get("Reloading") + " : " + string(global.weapon_db[argument1,9])
        }
    break;
    case global.inven_equip:
        if global.equip_db[argument1,4] == 1 or global.equip_db[argument1,4] == 4 //cloth
        {
            str += string_trim_auto(lang_get(global.equip_db[argument1,3])) + "##"
            str += lang_get("Defense") + " : " + string(global.equip_db[argument1,5]) + "#"
            str += lang_get("Speed") + " : " + string(global.equip_db[argument1,6])
        }
        else // equip
        {
            str += string_trim_auto(lang_get(global.equip_db[argument1,3]))
        }
    break;
    case global.inven_use:
        str += string_trim_auto(lang_get(global.use_db[argument1,2])) + "##"
        str += lang_get("Health recovery") + " : " + string(global.use_db[argument1,4]) + "#"
        str += lang_get("Hunger recovery") + " : " + string(global.use_db[argument1,3])
    break;
    case global.inven_etc:
        str += string_trim_auto(lang_get(global.etc_db[argument1,2]))
    break;
}

return str;
