var snd = -4;
switch(weapon_pointer)
{
    case 9: snd = snd_auto_pistol; break;  //Auto pistol
    case 10: snd = snd_pistol; break; //Pistol
    case 12: snd = snd_revolver; break; //Revolver
    case 13: snd = snd_semi_auto_rifle; break; //Semi auto rifle
    case 14: snd = snd_ak47; break; //AK-47
    case 15: snd = snd_m16; break; //M16
    case 16: snd = snd_pump_action_shotgun; break; //Pump action shotgu
    case 17: snd = snd_semi_auto_shotgun; break; //Semi auto shotgun
    case 18: snd = snd_light_machine; break; //Light machine gun
    case 19: snd = snd_heavy_machine; break; //Heavy machine gun
    case 20: snd = snd_bolt_action_sniper; break; //Bolt action sniper
    case 21: snd = snd_semi_auto_sniper; break; //Semi auto sniper
    case 23: snd = snd_bow_release; break; //cross bow
    case 26: snd = snd_stun_gun; break; //stun gun
}
if snd != -4
{audio_play_sound(snd,0,0)}
