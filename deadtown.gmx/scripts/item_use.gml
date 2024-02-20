/// only for use
var ins;
var pointer = argument0;
var target_inven = global.inven_use;

target_inven[? pointer] -= 1;
if target_inven[? pointer] <= 0
{
    ds_map_delete(target_inven,pointer);
}


ins = instance_create(0,0,sys_player_buff)
ins.hungry = db_info_get(target_inven,pointer,3) // hungry
ins.hp = db_info_get(target_inven,pointer,4) // hp
ins.buff_speed = db_info_get(target_inven,pointer,5)*30*60 // speed 
ins.buff_relax = db_info_get(target_inven,pointer,6)*30*60 // relax 
ins.buff_painkiller = db_info_get(target_inven,pointer,7)*30*60 // painkiller 

sys_UI.hungry += db_info_get(target_inven,pointer,3)
sys_UI.hp += db_info_get(target_inven,pointer,4)
