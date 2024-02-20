var snd = -4;
switch(weapon_pointer)
{
    case 9: snd = snd_weapon_reload_pistol; break;  //Auto pistol
    case 10: snd = snd_weapon_reload_pistol; break; //Pistol
    case 12: snd = snd_weapon_reload_pistol; break; //Revolver
    case 13: snd = snd_weapon_reload_rifle1; break; //Semi auto rifle
    case 14: snd = snd_weapon_reload_rifle2; break; //AK-47
    case 15: snd = snd_weapon_reload_rifle2; break; //M16
    case 16: snd = snd_weapon_reload_shotgun; break; //Pump action shotgu
    case 17: snd = snd_weapon_reload_shotgun; break; //Semi auto shotgun
    case 18: snd = snd_weapon_reload_machine; break; //Light machine gun
    case 19: snd = snd_weapon_reload_machine; break; //Heavy machine gun
    case 20: snd = snd_weapon_reload_sniper; break; //Bolt action sniper
    case 21: snd = snd_weapon_reload_sniper; break; //Semi auto sniper
    case 23: snd = snd_bow_draw; break; //Semi auto sniper
}
if snd != -4
{audio_play_sound(snd,0,0)}
