var pointer;
var item_type = argument0;
var item_index = argument1;
var item_number = argument2;
var target_inven;

switch(item_type)
{
    case 1: target_inven = global.inven_weapon;break;
    case 2: target_inven = global.inven_equip;break;
    case 3: target_inven = global.inven_use;break;
    case 4: target_inven = global.inven_etc;break;
}

ui_message_type(db_info_get(target_inven,item_index,0)+ " X" +string(item_number))

if target_inven == global.inven_etc
{
    if item_index == 44
    {global.item_ammo_normal += item_number; return 0;}
    if item_index == 45
    {global.item_ammo_shotgun += item_number; return 0;}
    if item_index == 46
    {global.item_ammo_machinegun += item_number; return 0;}
    if item_index == 47
    {global.item_ammo_arrow += item_number; return 0;}
    if item_index == 48
    {global.item_oil += item_number; return 0;}
}

inven_size = ds_map_size(target_inven);
pointer = ds_map_find_first(target_inven);
suc = 0;
for (i = 0; i < inven_size; i++;)
{
    if pointer != item_index
    {
        pointer = ds_map_find_next(target_inven, pointer);
    }
    else
    {
        suc = 1
        target_inven[? pointer] += item_number;
        break;    
    }
}

if suc == 0
{
    ds_map_add(target_inven, item_index, item_number);
}
