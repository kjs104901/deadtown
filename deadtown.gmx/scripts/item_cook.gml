var target_inven = global.inven_use;
var item_index = argument0

var cook_index = db_info_get(target_inven,item_index,8);

if (item_drop(3,item_index))
{
    achievement_plus(5)
    if rpg_skill_get_level(11) == 1
    {
        if random(100) < 15
        {item_get(3,cook_index,2)}
        else
        {item_get(3,cook_index,1)}
    }
    else if rpg_skill_get_level(11) == 2
    {
        if random(100) < 30
        {item_get(3,cook_index,2)}
        else
        {item_get(3,cook_index,1)}
    }
    else
    {
        item_get(3,cook_index,1)
    }
}
