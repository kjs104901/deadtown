/// (target_inven,index,which info)
switch(argument0)
{
    case global.inven_weapon:
        if (argument2 == 0) or (argument2 == 3)
        {
            return lang_get(global.weapon_db[argument1,argument2]);
        }
        else
        {
            return global.weapon_db[argument1,argument2];
        }
    break;
    case global.inven_equip:
        if (argument2 == 0) or (argument2 == 3)
        {
            return lang_get(global.equip_db[argument1,argument2]);
        }
        else
        {
            return global.equip_db[argument1,argument2];
        }
    break;
    case global.inven_use:
        if (argument2 == 0) or (argument2 == 2)
        {
            return lang_get(global.use_db[argument1,argument2]);
        }
        else
        {
            return global.use_db[argument1,argument2];
        }
    break;
    case global.inven_etc:
        if (argument2 == 0) or (argument2 == 2)
        {
            return lang_get(global.etc_db[argument1,argument2]);
        }
        else
        {
            return global.etc_db[argument1,argument2];
        }
    break;
}
