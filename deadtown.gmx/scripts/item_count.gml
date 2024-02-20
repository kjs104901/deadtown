var pointer;
var item_type = argument0;
var item_index = argument1;
var target_inven;
var r;

switch(item_type)
{
    case 1: target_inven = global.inven_weapon;break;
    case 2: target_inven = global.inven_equip;break;
    case 3: target_inven = global.inven_use;break;
    case 4: target_inven = global.inven_etc;break;
}

r = ds_map_find_value(target_inven,item_index)
if is_undefined(r)
{return 0;}
else
{return r;}
