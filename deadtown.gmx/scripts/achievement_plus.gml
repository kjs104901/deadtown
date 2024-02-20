global.achievement_info[argument0,0] += 1

if global.achievement_info[argument0,1] < global.achievement_info[argument0,0]
{
    global.achievement_info[argument0,0] = global.achievement_info[argument0,1]
}


if achievement_available()
{
    if os_type == os_android
    {ach = global.achievement_info[argument0,2]}
    if os_type == os_ios
    {ach = global.achievement_info[argument0,3]}
    
    achievement_post(ach, floor(100*global.achievement_info[argument0,0]/global.achievement_info[argument0,1]));
}

achievement_save()
