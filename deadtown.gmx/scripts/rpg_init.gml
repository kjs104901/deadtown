global.skill_point = 0
for (i=0;i<global.skill_db_target;i+=1)
{
    global.skill_level[i] = 0
}

global.player_level = 1
global.player_exp = 0
global.player_exp_max = floor(sqrt(global.player_level)*10+2)*10

global.player_survival_day = 0

global.player_death_count = 0
