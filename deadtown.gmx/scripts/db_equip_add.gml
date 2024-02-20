var item_name = argument0 // 이름
var item_sprite = argument1 //아이템 스프라이트
var item_get_sprite = argument2 // 착용 스프라이트
var item_detail = argument3 //설명
var item_kind = argument4 //종류(머리 몸통 다리 발)
var item_defend = argument5 //방어도
var item_speed = argument6 //이동속도 감소 또는 증가

global.equip_db[global.equip_db_target,0]=item_name
global.equip_db[global.equip_db_target,1]=item_sprite
global.equip_db[global.equip_db_target,2]=item_get_sprite
global.equip_db[global.equip_db_target,3]=item_detail
global.equip_db[global.equip_db_target,4]=item_kind
global.equip_db[global.equip_db_target,5]=item_defend
global.equip_db[global.equip_db_target,6]=item_speed

global.equip_db_target += 1
