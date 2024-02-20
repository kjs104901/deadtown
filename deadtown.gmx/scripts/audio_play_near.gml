var snd = -4;
switch(weapon_pointer)
{
    case 0: snd = snd_weapon_swing1; break; //Dagger
    case 1: snd = snd_weapon_swing2; break; //Wooden stick
    case 2: snd = snd_weapon_swing3; break; //Axe
    case 3: snd = snd_weapon_swing2; break; //Crowbar
    case 4: snd = snd_weapon_swing2; break; //Saw
    case 6: snd = snd_weapon_swing3; break; //Baseball bat
    case 7: snd = snd_weapon_swing4; break; //Machete
    case 8: snd = snd_weapon_swing2; break; //Golf club
    case 11: snd = snd_weapon_swing4; break; //Katana
    case 27: snd = snd_weapon_swing3; break; //Stone axe
}

if snd != -4
{audio_play(snd)}
