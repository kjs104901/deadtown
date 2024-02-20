if achievement_available()
{
    if os_type == os_android
    {ldb = global.leaderboard_info[argument0,0]}
    if os_type == os_ios
    {ldb = global.leaderboard_info[argument0,1]}

    achievement_post_score(ldb, argument1)
}
