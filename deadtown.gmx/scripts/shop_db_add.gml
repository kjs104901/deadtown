/// shop_db_add(type,name,image_index,explain,price)

global.shop_db[global.shop_db_index,0] = argument0 // type 0:1 time
global.shop_db[global.shop_db_index,1] = argument1 // name
global.shop_db[global.shop_db_index,2] = argument2 // sprite image index
global.shop_db[global.shop_db_index,3] = argument3 // explain
global.shop_db[global.shop_db_index,4] = argument4 // price

global.shop_db[global.shop_db_index,5] = 0 // have

global.shop_db_index += 1
