var filename = argument0;
var str = "";
var file;
var file_buffer;

instance_activate_all();

if file_exists(filename)
{file_delete(filename)}

ini_open(filename)
// inventory
ini_write_string("inventory","weapon",ds_map_write(global.inven_weapon))
ini_write_string("inventory","equip",ds_map_write(global.inven_equip))
ini_write_string("inventory","use",ds_map_write(global.inven_use))
ini_write_string("inventory","etc",ds_map_write(global.inven_etc))

// equip - when load, need to make an object 'sys_player_weapon'
ini_write_real("equip","weapon",global.equip_weapon)

ini_write_real("equip","cloth",global.equip_cloth)
ini_write_real("equip","hand",global.equip_hand)
ini_write_real("equip","gun",global.equip_gun)
ini_write_real("equip","deco",global.equip_deco)

// ammo
ini_write_real("ammo","normal",global.item_ammo_normal)
ini_write_real("ammo","shotgun",global.item_ammo_shotgun)
ini_write_real("ammo","machinegun",global.item_ammo_machinegun)
ini_write_real("ammo","arrow",global.item_ammo_arrow)
ini_write_real("ammo","oil",global.item_oil)
ini_write_real("ammo","electric",global.item_electric)

// rpg
ini_write_real("rpg","skillpoint",global.skill_point)
for (i=0;i<global.skill_db_target;i+=1)
{
    ini_write_real("rpg","skilllevel_"+string(i),global.skill_level[i])
}
ini_write_real("rpg","playerlevel",global.player_level)
ini_write_real("rpg","playerexp",global.player_exp)
ini_write_real("rpg","playerexpmax",global.player_exp_max)
ini_write_real("rpg","playerdeathcount",global.player_death_count)

// time
ini_write_real("time","day",sys_spawn_time_light.day)
ini_write_real("time","daytime",sys_spawn_time_light.day_time)
ini_write_real("time","weather",sys_spawn_time_light.weather)

ini_write_real("time","boss1",sys_spawn_time_light.boss1_day)
ini_write_real("time","boss2",sys_spawn_time_light.boss2_day)
ini_write_real("time","boss3",sys_spawn_time_light.boss3_day)
ini_write_real("time","boss4",sys_spawn_time_light.boss4_day)

// spawn queue

ini_write_real("spawn","wave1queue",sys_spawn_time_light.zombie_wave1_number)
ini_write_real("spawn","wave2queue",sys_spawn_time_light.zombie_wave2_number)
ini_write_real("spawn","wave3queue",sys_spawn_time_light.zombie_wave3_number)

ini_write_real("spawn","specialwave1queue",sys_spawn_time_light.zombie_special_wave1_number)
ini_write_real("spawn","specialwave2queue",sys_spawn_time_light.zombie_special_wave2_number)
ini_write_real("spawn","specialwave3queue",sys_spawn_time_light.zombie_special_wave3_number)


// view
ini_write_real("view","viewa",sys_view.view_a)

// player
ini_write_real("player","x",obj_player.x)
ini_write_real("player","y",obj_player.y)

ini_write_real("player","hp",obj_player.hp)
ini_write_real("player","hp_max",obj_player.hp_max)
ini_write_real("player","hungry",obj_player.hungry)

ini_write_real("player","playercostume",obj_player.player_costume)

ini_write_real("player","buffspeed",obj_player.buff_speed)
ini_write_real("player","buffrelax",obj_player.buff_relax)
ini_write_real("player","buffpainkiller",obj_player.buff_painkiller)
ini_write_real("player","buffpoison",obj_player.buff_poison)

// pet
if instance_exists(obj_bird)
{
    ini_write_real("pet","bird",1)
    ini_write_real("pet","birdtype",obj_bird.bird_type)
}
if instance_exists(obj_dog)
{
    ini_write_real("pet","dog",1)
    ini_write_real("pet","dogtype",obj_dog.dog_type)
}

// ------------ object ------------  //
map_obj = ds_map_create()

/// obj_bicycle
    ini_write_real("obj_bicycle","number",instance_number(obj_bicycle))
    for (i=0; i<instance_number(obj_bicycle); i++)
    {
        ins = instance_find(obj_bicycle,i)
        ds_map_clear(map_obj)
        ds_map_add(map_obj,"x",ins.x)
        ds_map_add(map_obj,"y",ins.y)
        ds_map_add(map_obj,"image_angle",ins.image_angle)
        ini_write_string("obj_bicycle",string(i),ds_map_write(map_obj))
    }
    
/// obj_motocycle
    ini_write_real("obj_motocycle","number",instance_number(obj_motocycle))
    for (i=0; i<instance_number(obj_motocycle); i++)
    {
        ins = instance_find(obj_motocycle,i)
        ds_map_clear(map_obj)
        ds_map_add(map_obj,"x",ins.x)
        ds_map_add(map_obj,"y",ins.y)
        ds_map_add(map_obj,"image_angle",ins.image_angle)
        ini_write_string("obj_motocycle",string(i),ds_map_write(map_obj))
    }
    
/// obj_zombie
    ini_write_real("obj_zombie","number",instance_number(obj_zombie))
    for (i=0; i<instance_number(obj_zombie); i++)
    {
        ds_map_clear(map_obj)
        ins = instance_find(obj_zombie,i)
        ds_map_add(map_obj,"x",ins.x)
        ds_map_add(map_obj,"y",ins.y)
        
        ds_map_add(map_obj,"move_speed",ins.move_speed)
        ds_map_add(map_obj,"image_xscale",ins.image_xscale)
        ds_map_add(map_obj,"image_yscale",ins.image_yscale)
        ds_map_add(map_obj,"feet_dis",ins.feet_dis)
        ds_map_add(map_obj,"foot_long",ins.foot_long)
        
        ds_map_add(map_obj,"image_angle",ins.image_angle)
        ds_map_add(map_obj,"wave_zombie",ins.wave_zombie)
        ds_map_add(map_obj,"hp",ins.hp)
        ds_map_add(map_obj,"detect",ins.detect)
        ds_map_add(map_obj,"my_angle",ins.my_angle)
        ds_map_add(map_obj,"my_angle_slow",ins.my_angle_slow)
        ini_write_string("obj_zombie",string(i),ds_map_write(map_obj))
    }
    
/// obj_zombie2
    ini_write_real("obj_zombie2","number",instance_number(obj_zombie2))
    for (i=0; i<instance_number(obj_zombie2); i++)
    {
        ds_map_clear(map_obj)
        ins = instance_find(obj_zombie2,i)
        ds_map_add(map_obj,"x",ins.x)
        ds_map_add(map_obj,"y",ins.y)
        ds_map_add(map_obj,"image_angle",ins.image_angle)
        ds_map_add(map_obj,"wave_zombie",ins.wave_zombie)
        ds_map_add(map_obj,"hp",ins.hp)
        ds_map_add(map_obj,"detect",ins.detect)
        ds_map_add(map_obj,"my_angle",ins.my_angle)
        ds_map_add(map_obj,"my_angle_slow",ins.my_angle_slow)
        ini_write_string("obj_zombie2",string(i),ds_map_write(map_obj))
    }
    
/// obj_zombie3
    ini_write_real("obj_zombie3","number",instance_number(obj_zombie3))
    for (i=0; i<instance_number(obj_zombie3); i++)
    {
        ds_map_clear(map_obj)
        ins = instance_find(obj_zombie3,i)
        ds_map_add(map_obj,"x",ins.x)
        ds_map_add(map_obj,"y",ins.y)
        ds_map_add(map_obj,"image_angle",ins.image_angle)
        ds_map_add(map_obj,"wave_zombie",ins.wave_zombie)
        ds_map_add(map_obj,"hp",ins.hp)
        ds_map_add(map_obj,"detect",ins.detect)
        ds_map_add(map_obj,"my_angle",ins.my_angle)
        ds_map_add(map_obj,"my_angle_slow",ins.my_angle_slow)
        ini_write_string("obj_zombie3",string(i),ds_map_write(map_obj))
    }
    
/// obj_zombie4
    ini_write_real("obj_zombie4","number",instance_number(obj_zombie4))
    for (i=0; i<instance_number(obj_zombie4); i++)
    {
        ds_map_clear(map_obj)
        ins = instance_find(obj_zombie4,i)
        ds_map_add(map_obj,"x",ins.x)
        ds_map_add(map_obj,"y",ins.y)
        ds_map_add(map_obj,"image_angle",ins.image_angle)
        ds_map_add(map_obj,"wave_zombie",ins.wave_zombie)
        ds_map_add(map_obj,"hp",ins.hp)
        ds_map_add(map_obj,"detect",ins.detect)
        ds_map_add(map_obj,"my_angle",ins.my_angle)
        ds_map_add(map_obj,"my_angle_slow",ins.my_angle_slow)
        ini_write_string("obj_zombie4",string(i),ds_map_write(map_obj))
    }
    
/// obj_zombie5
    ini_write_real("obj_zombie5","number",instance_number(obj_zombie5))
    for (i=0; i<instance_number(obj_zombie5); i++)
    {
        ds_map_clear(map_obj)
        ins = instance_find(obj_zombie5,i)
        ds_map_add(map_obj,"x",ins.x)
        ds_map_add(map_obj,"y",ins.y)
        ds_map_add(map_obj,"image_angle",ins.image_angle)
        ds_map_add(map_obj,"wave_zombie",ins.wave_zombie)
        ds_map_add(map_obj,"hp",ins.hp)
        ds_map_add(map_obj,"detect",ins.detect)
        ds_map_add(map_obj,"my_angle",ins.my_angle)
        ds_map_add(map_obj,"my_angle_slow",ins.my_angle_slow)
        ini_write_string("obj_zombie5",string(i),ds_map_write(map_obj))
    }
    
/// obj_craftdesk
    ini_write_real("obj_craftdesk","number",instance_number(obj_craftdesk))
    for (i=0; i<instance_number(obj_craftdesk); i++)
    {
        ins = instance_find(obj_craftdesk,i)
        ds_map_clear(map_obj)
        ds_map_add(map_obj,"x",ins.x)
        ds_map_add(map_obj,"y",ins.y)
        ds_map_add(map_obj,"hp",ins.hp)
        ds_map_add(map_obj,"image_angle",ins.image_angle)
        ds_map_add(map_obj,"need_bettery",ins.need_bettery)
        ini_write_string("obj_craftdesk",string(i),ds_map_write(map_obj))
    }
    
/// obj_craftdesk_pro
    ini_write_real("obj_craftdesk_pro","number",instance_number(obj_craftdesk_pro))
    for (i=0; i<instance_number(obj_craftdesk_pro); i++)
    {
        ins = instance_find(obj_craftdesk_pro,i)
        ds_map_clear(map_obj)
        ds_map_add(map_obj,"x",ins.x)
        ds_map_add(map_obj,"y",ins.y)
        ds_map_add(map_obj,"hp",ins.hp)
        ds_map_add(map_obj,"image_angle",ins.image_angle)
        ds_map_add(map_obj,"need_bettery",ins.need_bettery)
        ini_write_string("obj_craftdesk_pro",string(i),ds_map_write(map_obj))
    }
    
/// obj_turret
    ini_write_real("obj_turret","number",instance_number(obj_turret))
    for (i=0; i<instance_number(obj_turret); i++)
    {
        ins = instance_find(obj_turret,i)
        ds_map_clear(map_obj)
        ds_map_add(map_obj,"x",ins.x)
        ds_map_add(map_obj,"y",ins.y)
        ds_map_add(map_obj,"hp",ins.hp)
        ds_map_add(map_obj,"image_angle",ins.image_angle)
        ini_write_string("obj_turret",string(i),ds_map_write(map_obj))
    }
    
/// obj_turret_move
    ini_write_real("obj_turret_move","number",instance_number(obj_turret_move))
    for (i=0; i<instance_number(obj_turret_move); i++)
    {
        ins = instance_find(obj_turret_move,i)
        ds_map_clear(map_obj)
        ds_map_add(map_obj,"x",ins.x)
        ds_map_add(map_obj,"y",ins.y)
        ds_map_add(map_obj,"hp",ins.hp)
        ds_map_add(map_obj,"image_angle",ins.image_angle)
        ini_write_string("obj_turret_move",string(i),ds_map_write(map_obj))
    }
    
/// obj_lightaction
    ini_write_real("obj_lightaction","number",instance_number(obj_lightaction))
    for (i=0; i<instance_number(obj_lightaction); i++)
    {
        ins = instance_find(obj_lightaction,i)
        ds_map_clear(map_obj)
        ds_map_add(map_obj,"x",ins.x)
        ds_map_add(map_obj,"y",ins.y)
        ds_map_add(map_obj,"image_angle",ins.image_angle)
        ini_write_string("obj_lightaction",string(i),ds_map_write(map_obj))
    }

/// obj_lightaction_move
    ini_write_real("obj_lightaction_move","number",instance_number(obj_lightaction_move))
    for (i=0; i<instance_number(obj_lightaction_move); i++)
    {
        ins = instance_find(obj_lightaction_move,i)
        ds_map_clear(map_obj)
        ds_map_add(map_obj,"x",ins.x)
        ds_map_add(map_obj,"y",ins.y)
        ds_map_add(map_obj,"image_angle",ins.image_angle)
        ini_write_string("obj_lightaction_move",string(i),ds_map_write(map_obj))
    }
    
/// obj_bettery
    ini_write_real("obj_bettery","number",instance_number(obj_bettery))
    for (i=0; i<instance_number(obj_bettery); i++)
    {
        ins = instance_find(obj_bettery,i)
        ds_map_clear(map_obj)
        ds_map_add(map_obj,"x",ins.x)
        ds_map_add(map_obj,"y",ins.y)
        ds_map_add(map_obj,"image_angle",ins.image_angle)
        ds_map_add(map_obj,"electricity",ins.electricity)
        ds_map_add(map_obj,"hp",ins.hp)
        ini_write_string("obj_bettery",string(i),ds_map_write(map_obj))
    }
    
/// obj_generator_solar
    ini_write_real("obj_generator_solar","number",instance_number(obj_generator_solar))
    for (i=0; i<instance_number(obj_generator_solar); i++)
    {
        ins = instance_find(obj_generator_solar,i)
        ds_map_clear(map_obj)
        ds_map_add(map_obj,"x",ins.x)
        ds_map_add(map_obj,"y",ins.y)
        ds_map_add(map_obj,"image_angle",ins.image_angle)
        ds_map_add(map_obj,"hp",ins.hp)
        ini_write_string("obj_generator_solar",string(i),ds_map_write(map_obj))
    }
    
/// obj_generator_nuclear
    ini_write_real("obj_generator_nuclear","number",instance_number(obj_generator_nuclear))
    for (i=0; i<instance_number(obj_generator_nuclear); i++)
    {
        ins = instance_find(obj_generator_nuclear,i)
        ds_map_clear(map_obj)
        ds_map_add(map_obj,"x",ins.x)
        ds_map_add(map_obj,"y",ins.y)
        ds_map_add(map_obj,"image_angle",ins.image_angle)
        ds_map_add(map_obj,"hp",ins.hp)
        ini_write_string("obj_generator_nuclear",string(i),ds_map_write(map_obj))
    }
    
/// obj_generator_oil
    ini_write_real("obj_generator_oil","number",instance_number(obj_generator_oil))
    for (i=0; i<instance_number(obj_generator_oil); i++)
    {
        ins = instance_find(obj_generator_oil,i)
        ds_map_clear(map_obj)
        ds_map_add(map_obj,"x",ins.x)
        ds_map_add(map_obj,"y",ins.y)
        ds_map_add(map_obj,"image_angle",ins.image_angle)
        ds_map_add(map_obj,"hp",ins.hp)
        ds_map_add(map_obj,"oil",ins.oil)
        ini_write_string("obj_generator_oil",string(i),ds_map_write(map_obj))
    }
    
/// obj_door
    ini_write_real("obj_door","number",instance_number(obj_door))
    for (i=0; i<instance_number(obj_door); i++)
    {
        ins = instance_find(obj_door,i)
        ds_map_clear(map_obj)
        ds_map_add(map_obj,"x",ins.x)
        ds_map_add(map_obj,"y",ins.y)
        ds_map_add(map_obj,"image_angle",ins.image_angle)
        ds_map_add(map_obj,"hp",ins.hp)
        ini_write_string("obj_door",string(i),ds_map_write(map_obj))
    }
    
/// obj_barricade
    ini_write_real("obj_barricade","number",instance_number(obj_barricade))
    for (i=0; i<instance_number(obj_barricade); i++)
    {
        ins = instance_find(obj_barricade,i)
        ds_map_clear(map_obj)
        ds_map_add(map_obj,"x",ins.x)
        ds_map_add(map_obj,"y",ins.y)
        ds_map_add(map_obj,"image_angle",ins.image_angle)
        ds_map_add(map_obj,"hp",ins.hp)
        ini_write_string("obj_barricade",string(i),ds_map_write(map_obj))
    }
    
/// obj_iron_door
    ini_write_real("obj_iron_door","number",instance_number(obj_iron_door))
    for (i=0; i<instance_number(obj_iron_door); i++)
    {
        ins = instance_find(obj_iron_door,i)
        ds_map_clear(map_obj)
        ds_map_add(map_obj,"x",ins.x)
        ds_map_add(map_obj,"y",ins.y)
        ds_map_add(map_obj,"image_angle",ins.image_angle)
        ds_map_add(map_obj,"hp",ins.hp)
        ini_write_string("obj_iron_door",string(i),ds_map_write(map_obj))
    }
    
/// obj_iron_barricade
    ini_write_real("obj_iron_barricade","number",instance_number(obj_iron_barricade))
    for (i=0; i<instance_number(obj_iron_barricade); i++)
    {
        ins = instance_find(obj_iron_barricade,i)
        ds_map_clear(map_obj)
        ds_map_add(map_obj,"x",ins.x)
        ds_map_add(map_obj,"y",ins.y)
        ds_map_add(map_obj,"image_angle",ins.image_angle)
        ds_map_add(map_obj,"hp",ins.hp)
        ini_write_string("obj_iron_barricade",string(i),ds_map_write(map_obj))
    }
    
/// obj_campfire
    ini_write_real("obj_campfire","number",instance_number(obj_campfire))
    for (i=0; i<instance_number(obj_campfire); i++)
    {
        ins = instance_find(obj_campfire,i)
        ds_map_clear(map_obj)
        ds_map_add(map_obj,"x",ins.x)
        ds_map_add(map_obj,"y",ins.y)
        ds_map_add(map_obj,"image_angle",ins.image_angle)
        ds_map_add(map_obj,"hp",ins.hp)
        ds_map_add(map_obj,"wood",ins.wood)
        ini_write_string("obj_campfire",string(i),ds_map_write(map_obj))
    }
    
/// obj_brazier
    ini_write_real("obj_brazier","number",instance_number(obj_brazier))
    for (i=0; i<instance_number(obj_brazier); i++)
    {
        ins = instance_find(obj_brazier,i)
        ds_map_clear(map_obj)
        ds_map_add(map_obj,"x",ins.x)
        ds_map_add(map_obj,"y",ins.y)
        ds_map_add(map_obj,"image_angle",ins.image_angle)
        ds_map_add(map_obj,"hp",ins.hp)
        ds_map_add(map_obj,"wood",ins.wood)
        ini_write_string("obj_brazier",string(i),ds_map_write(map_obj))
    }
    
/// obj_trap_electric
    ini_write_real("obj_trap_electric","number",instance_number(obj_trap_electric))
    for (i=0; i<instance_number(obj_trap_electric); i++)
    {
        ins = instance_find(obj_trap_electric,i)
        ds_map_clear(map_obj)
        ds_map_add(map_obj,"x",ins.x)
        ds_map_add(map_obj,"y",ins.y)
        ds_map_add(map_obj,"image_angle",ins.image_angle)
        ds_map_add(map_obj,"hp",ins.hp)
        ini_write_string("obj_trap_electric",string(i),ds_map_write(map_obj))
    }
    
/// obj_trap
    ini_write_real("obj_trap","number",instance_number(obj_trap))
    for (i=0; i<instance_number(obj_trap); i++)
    {
        ins = instance_find(obj_trap,i)
        ds_map_clear(map_obj)
        ds_map_add(map_obj,"x",ins.x)
        ds_map_add(map_obj,"y",ins.y)
        ds_map_add(map_obj,"image_angle",ins.image_angle)
        ds_map_add(map_obj,"hp",ins.hp)
        ini_write_string("obj_trap",string(i),ds_map_write(map_obj))
    }
    
/// obj_gps
    ini_write_real("obj_gps","number",instance_number(obj_gps))
    for (i=0; i<instance_number(obj_gps); i++)
    {
        ins = instance_find(obj_gps,i)
        ds_map_clear(map_obj)
        ds_map_add(map_obj,"x",ins.x)
        ds_map_add(map_obj,"y",ins.y)
        ds_map_add(map_obj,"image_angle",ins.image_angle)
        ds_map_add(map_obj,"hp",ins.hp)
        ini_write_string("obj_gps",string(i),ds_map_write(map_obj))
    }

/// obj_cooker
    ini_write_real("obj_cooker","number",instance_number(obj_cooker))
    for (i=0; i<instance_number(obj_cooker); i++)
    {
        ins = instance_find(obj_cooker,i)
        ds_map_clear(map_obj)
        ds_map_add(map_obj,"x",ins.x)
        ds_map_add(map_obj,"y",ins.y)
        ds_map_add(map_obj,"image_angle",ins.image_angle)
        ds_map_add(map_obj,"hp",ins.hp)
        ini_write_string("obj_cooker",string(i),ds_map_write(map_obj))
    }
    
/// obj_brazier_electric
    ini_write_real("obj_brazier_electric","number",instance_number(obj_brazier_electric))
    for (i=0; i<instance_number(obj_brazier_electric); i++)
    {
        ins = instance_find(obj_brazier_electric,i)
        ds_map_clear(map_obj)
        ds_map_add(map_obj,"x",ins.x)
        ds_map_add(map_obj,"y",ins.y)
        ds_map_add(map_obj,"image_angle",ins.image_angle)
        ds_map_add(map_obj,"hp",ins.hp)
        ini_write_string("obj_brazier_electric",string(i),ds_map_write(map_obj))
    }

/// obj_item
    ini_write_real("obj_item","number",instance_number(obj_item))
    for (i=0; i<instance_number(obj_item); i++)
    {
        ins = instance_find(obj_item,i)
        ds_map_clear(map_obj)
        ds_map_add(map_obj,"x",ins.x)
        ds_map_add(map_obj,"y",ins.y)
        ds_map_add(map_obj,"image_angle",ins.image_angle)
        ds_map_add(map_obj,"item_sprite",ins.item_sprite)
        ds_map_add(map_obj,"item_type",ins.item_type)
        ds_map_add(map_obj,"item_index",ins.item_index)
        ds_map_add(map_obj,"item_number",ins.item_number)
        ini_write_string("obj_item",string(i),ds_map_write(map_obj))
    }
    
/// obj_item_building
    ccccc = 0
    for (i=0; i<instance_number(obj_item_building); i++)
    {
        ins = instance_find(obj_item_building,i)
        
        if point_distance(ins.x,ins.y,obj_player.x,obj_player.y) < sys_spawn_time_light.item_save_dis_max
        {
            ccccc += 1
            ds_map_clear(map_obj)
            ds_map_add(map_obj,"x",ins.x)
            ds_map_add(map_obj,"y",ins.y)
            ds_map_add(map_obj,"image_angle",ins.image_angle)
            ds_map_add(map_obj,"item_sprite",ins.item_sprite)
            ds_map_add(map_obj,"item_type",ins.item_type)
            ds_map_add(map_obj,"item_index",ins.item_index)
            ds_map_add(map_obj,"item_number",ins.item_number)
            ini_write_string("obj_item_building",string(i),ds_map_write(map_obj))
        }
    }
    ini_write_real("obj_item_building","number",ccccc)
    
/// obj_parcel
    ini_write_real("obj_parcel","number",instance_number(obj_parcel))
    for (i=0; i<instance_number(obj_parcel); i++)
    {
        ins = instance_find(obj_parcel,i)
        ds_map_clear(map_obj)
        ds_map_add(map_obj,"x",ins.x)
        ds_map_add(map_obj,"y",ins.y)
        ds_map_add(map_obj,"image_angle",ins.image_angle)
        
        for(j=0;j<sys_spawn_time_light.parcel_item_number;j++)
        {
            ds_map_add(map_obj,"item_type_"+string(j),ins.item_type[j])
            ds_map_add(map_obj,"item_index_"+string(j),ins.item_index[j])
            ds_map_add(map_obj,"item_number_"+string(j),ins.item_number[j])
        }
        
        ini_write_string("obj_parcel",string(i),ds_map_write(map_obj))
    }
ds_map_destroy(map_obj)
// ------------ ------ ------------  //

ini_close()

file_buffer = buffer_load(filename)
file_delete(filename)
str = buffer_base64_encode(file_buffer,0,buffer_get_size(file_buffer))
file = file_text_open_write(filename)
file_text_write_string(file, str)
file_text_close(file)
buffer_delete(file_buffer)

deactive_auto()
