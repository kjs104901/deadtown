var skill_name = argument0 // 이름
var skill_detail = argument1 // 설명
var skill_kind = argument2 // 종류
var skill_max_level = argument3 // 최대 레벨

global.skill_db[global.skill_db_target,0]=skill_name
global.skill_db[global.skill_db_target,1]=skill_detail
global.skill_db[global.skill_db_target,2]=skill_kind
global.skill_db[global.skill_db_target,3]=skill_max_level

global.skill_db_target += 1
