var item_name = argument0 // 이름
var item_sprite = argument1 //아이템 스프라이트
var item_detail = argument2 //설명
var item_fired = argument3 //화로 인덱스

global.etc_db[global.etc_db_target,0]=item_name
global.etc_db[global.etc_db_target,1]=item_sprite
global.etc_db[global.etc_db_target,2]=item_detail
global.etc_db[global.etc_db_target,3]=item_fired

global.etc_db_target += 1
