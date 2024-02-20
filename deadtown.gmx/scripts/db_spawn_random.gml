var building = argument0
var size;

size = ds_list_size(global.item_spawn_db_list[building])
return ds_list_find_value(global.item_spawn_db_list[building], irandom_range(0,size-1));
