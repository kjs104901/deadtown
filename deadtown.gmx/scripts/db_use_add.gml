var item_name = argument0 // 이름
var item_sprite = argument1 //아이템 스프라이트
var item_detail = argument2 //설명
var item_foods = argument3 //허기 회복
var item_health = argument4 //체력 회복
var item_speed = argument5 //이동속도 버프
var item_calm = argument6 //반동제어 버프
var item_pain = argument7 //피격효과 감소 버프
var item_cooked = argument8 //요리 인덱스

global.use_db[global.use_db_target,0]=item_name
global.use_db[global.use_db_target,1]=item_sprite
global.use_db[global.use_db_target,2]=item_detail
global.use_db[global.use_db_target,3]=item_foods
global.use_db[global.use_db_target,4]=item_health
global.use_db[global.use_db_target,5]=item_speed
global.use_db[global.use_db_target,6]=item_calm
global.use_db[global.use_db_target,7]=item_pain
global.use_db[global.use_db_target,8]=item_cooked

global.use_db_target += 1
