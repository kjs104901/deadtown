/// only for weapon and equipment
var item_type = argument0 // 1:weapon 2:equip
var pointer = argument1

switch(item_type)
{
    case 1: target_inven = global.inven_weapon;break;
    case 2: target_inven = global.inven_equip;break;
    case 3: target_inven = global.inven_use;break;
    case 4: target_inven = global.inven_etc;break;
}

if is_undefined(target_inven[? pointer])
{
    return 0;
}
else
{
    target_inven[? pointer] -= 1;
    if target_inven[? pointer] <= 0
    {
        ds_map_delete(target_inven,pointer);
    }
    return 1;
}
