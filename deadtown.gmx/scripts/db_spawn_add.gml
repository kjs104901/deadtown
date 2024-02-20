var item_spawn_building = argument0;
var item_spawn_item_type = argument1;
var item_spawn_item_index = argument2;
var item_spawn_item_min = argument3;
var item_spawn_item_max = argument4;

global.item_spawn_db[global.item_spawn_db_target,0] = item_spawn_building
global.item_spawn_db[global.item_spawn_db_target,1] = item_spawn_item_type
global.item_spawn_db[global.item_spawn_db_target,2] = item_spawn_item_index
global.item_spawn_db[global.item_spawn_db_target,3] = item_spawn_item_min
global.item_spawn_db[global.item_spawn_db_target,4] = item_spawn_item_max

global.item_spawn_db_target += 1

global.spawn_building_kind = max(global.spawn_building_kind,item_spawn_building)
