var index;
for (index=0; index<=global.spawn_building_kind; index++)
{
    global.item_spawn_db_list[index] = ds_list_create() // normal
    for (i=0; i<global.item_spawn_db_target; i++)
    {
        if global.item_spawn_db[i,0] == index
        {ds_list_add(global.item_spawn_db_list[index],i)}
    }
}
