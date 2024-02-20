var target_inven = global.inven_etc;
var item_index = argument0;

cook_index = db_info_get(target_inven,item_index,3)

if (item_drop(4,item_index))
{
    achievement_plus(6)
    if rpg_skill_get_level(12) == 1
    {
        if random(100) < 15
        {item_get(4,cook_index,2)}
        else
        {item_get(4,cook_index,1)}
    }
    else if rpg_skill_get_level(12) == 2
    {
        if random(100) < 30
        {item_get(4,cook_index,2)}
        else
        {item_get(4,cook_index,1)}
    }
    else
    {
        item_get(4,cook_index,1)
    }
}
