/// only for weapon and equipment
var item_type = argument0 // 1:weapon 2:equip
var pointer = argument1

switch(item_type)
{
    case 1: target_inven = global.inven_weapon;break;
    case 2: target_inven = global.inven_equip;break;
}

target_inven[? pointer] -= 1;
if target_inven[? pointer] <= 0
{
    ds_map_delete(target_inven,pointer);
}

/////////// 기존에 있던 아이템 돌려받기
if item_type == 1 // kind check
{
    if global.equip_weapon >= 0 
    {
        item_get(1,global.equip_weapon,1)
    }
    global.equip_weapon = pointer;
    // 무기 착용 처리
    
    if instance_exists(sys_player_weapon)
    {ins_weapon = sys_player_weapon}
    else
    {ins_weapon = instance_create(0,0,sys_player_weapon)}
    ins_weapon.pointer = pointer
}
if item_type == 2
{
    target_equip = -1
    
    if instance_exists(sys_player_equipment)
    {ins_equipment = sys_player_equipment}
    else
    {ins_equipment = instance_create(0,0,sys_player_equipment)}
    switch (global.equip_db[pointer,4])
    {
        case 1:
            target_equip = global.equip_cloth; 
            ins_equipment.cloth_pointer = pointer
            global.equip_cloth = pointer;
        break;
        case 2:
            target_equip = global.equip_hand;
            ins_equipment.hand_pointer = pointer
            global.equip_hand = pointer;
        break;
        case 3:
            target_equip = global.equip_gun;
            ins_equipment.gun_pointer = pointer
            global.equip_gun = pointer;
        break;
        case 4:
            target_equip = global.equip_deco;
            ins_equipment.deco_pointer = pointer
            global.equip_deco = pointer;
        break;
    }
    if target_equip >= 0
    {
        item_get(2,target_equip,1)
    }
}
