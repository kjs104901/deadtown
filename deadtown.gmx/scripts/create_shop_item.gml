var ins = instance_create(0,0,obj_shop_item);
ins.item_type = argument0
ins.item_slot_index = argument1
ins.item_index = argument2
ins.item_name = argument3
ins.item_product_id = argument4
if lang_type_get() == 0 or os_type == os_ios
{ins.item_price = argument5}
else if lang_type_get() == 1
{ins.item_price = argument6}
