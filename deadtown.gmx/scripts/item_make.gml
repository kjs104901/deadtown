var craft_index = argument0

var craft_kind = global.craft_db[craft_index,0]

var craft_kind1 = global.craft_db[craft_index,1]
var craft_index1 = global.craft_db[craft_index,2]
var craft_number1 = global.craft_db[craft_index,3]

var craft_kind2 = global.craft_db[craft_index,4]
var craft_index2 = global.craft_db[craft_index,5]
var craft_number2 = global.craft_db[craft_index,6]

var craft_kind3 = global.craft_db[craft_index,7]
var craft_index3 = global.craft_db[craft_index,8]
var craft_number3 = global.craft_db[craft_index,9]

var craft_kind4 = global.craft_db[craft_index,10]
var craft_index4 = global.craft_db[craft_index,11]
var craft_number4 = global.craft_db[craft_index,12]

target_inven1 = global.inven_null
target_inven2 = global.inven_null
target_inven3 = global.inven_null

switch(craft_kind1)
{
    case 1: target_inven1 = global.inven_weapon;break;
    case 2: target_inven1 = global.inven_equip;break;
    case 3: target_inven1 = global.inven_use;break;
    case 4: target_inven1 = global.inven_etc;break;
}
switch(craft_kind2)
{
    case 1: target_inven2 = global.inven_weapon;break;
    case 2: target_inven2 = global.inven_equip;break;
    case 3: target_inven2 = global.inven_use;break;
    case 4: target_inven2 = global.inven_etc;break;
}
switch(craft_kind3)
{
    case 1: target_inven3 = global.inven_weapon;break;
    case 2: target_inven3 = global.inven_equip;break;
    case 3: target_inven3 = global.inven_use;break;
    case 4: target_inven3 = global.inven_etc;break;
}

if (!is_undefined(target_inven1[? craft_index1]) and (craft_number1 <= target_inven1[? craft_index1])) or (craft_number1 == 0)
{
    if (!is_undefined(target_inven2[? craft_index2]) and (craft_number2 <= target_inven2[? craft_index2])) or (craft_number2 == 0)
    {
        if (!is_undefined(target_inven3[? craft_index3]) and (craft_number3 <= target_inven3[? craft_index3])) or (craft_number3 == 0)
        {
            if 0 < craft_number1
            {
                target_inven1[? craft_index1] -= craft_number1
                if target_inven1[? craft_index1] <= 0
                {
                    ds_map_delete(target_inven1,craft_index1);
                }
            }
            
            if 0 < craft_number2
            {
                target_inven2[? craft_index2] -= craft_number2
                if target_inven2[? craft_index2] <= 0
                {
                    ds_map_delete(target_inven2,craft_index2);
                }
            }
            
            if 0 < craft_number3
            {
                target_inven3[? craft_index3] -= craft_number3
                if target_inven3[? craft_index3] <= 0
                {
                    ds_map_delete(target_inven3,craft_index3);
                }
            }
            
            if craft_kind == 1
            {
                ins = instance_create(-100,-100,obj_pre_install)
                switch(craft_index4) // manually choose object
                {
                    case 0: 
                        ins.object = obj_craftdesk
                        ins.craft_light = 0
                        ins.need_bettery = 0
                    break;
                    case 1: 
                        ins.object = obj_craftdesk_pro
                        ins.craft_light = 0
                        ins.need_bettery = 0
                    break;
                    case 2: 
                        ins.object = obj_turret
                        ins.need_bettery = 1
                    break;
                    case 3: 
                        ins.object = obj_turret_move
                    break;
                    case 4: 
                        ins.object = obj_lightaction
                        ins.need_bettery = 1
                    break;
                    case 5: 
                        ins.object = obj_lightaction_move
                    break;
                    case 6: 
                        ins.object = obj_bettery
                    break;
                    case 7: 
                        ins.object = obj_generator_solar
                        ins.need_bettery = 1
                        backpack_close()
                    break;
                    case 8: 
                        ins.object = obj_generator_nuclear
                        ins.need_bettery = 1
                    break;
                    case 9: 
                        ins.object = obj_generator_oil
                        ins.need_bettery = 1
                    break;
                    case 10: 
                        ins.object = obj_barricade
                    break;
                    case 11: 
                        ins.object = obj_door
                    break;
                    case 12: 
                        ins.object = obj_iron_barricade
                    break;
                    case 13: 
                        ins.object = obj_iron_door
                    break;
                    case 14: 
                        ins.object = obj_campfire
                    break;
                    case 15: 
                        ins.object = obj_brazier
                    break;
                    case 16: 
                        ins.object = obj_trap_electric
                        ins.need_bettery = 1
                    break;
                    case 17: 
                        ins.object = obj_trap
                    break;
                    case 18: 
                        ins.object = obj_gps
                    break;
                    case 19: 
                        ins.object = obj_cooker
                        ins.need_bettery = 1
                    break;
                    case 20: 
                        ins.object = obj_brazier_electric
                        ins.need_bettery = 1
                    break;
                    case 21: 
                        ins.object = obj_bicycle
                    break;
                    case 22: 
                        ins.object = obj_motocycle
                    break;
                    case 39: 
                        ins.object = obj_craftdesk
                        ins.craft_light = 1
                        ins.need_bettery = 1
                    break;
                    case 40: 
                        ins.object = obj_craftdesk_pro
                        ins.craft_light = 1
                        ins.need_bettery = 1
                    break;
                }
                backpack_close()
            }
            else
            {
                item_get(craft_kind4,craft_index4,craft_number4)
            }
            return 1
        }
    }
}

return 0
