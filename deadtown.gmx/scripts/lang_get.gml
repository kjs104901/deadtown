switch(global.language_type)
{
    case 0:
        return argument0;
    break;
    case 1:
        return ds_map_find_value(global.language_map_korean, argument0);
    break;
    case 2:
        return ds_map_find_value(global.language_map_chinese, argument0);
    break;
    case 3:
        return ds_map_find_value(global.language_map_japanese, argument0);
    break;
}
