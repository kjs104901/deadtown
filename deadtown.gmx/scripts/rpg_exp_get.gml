/// rpg_exp_get(expamount)
global.player_exp += argument0
if (global.player_exp_max < global.player_exp)
{
    global.player_exp -= global.player_exp_max
    
    ui_message_type(lang_get("Level UP"))
    audio_play_sound(snd_levelup,0,0)
    
    global.player_level += 1
    global.player_exp_max = floor(global.player_level*10+4)*15
    global.skill_point += 1
}
