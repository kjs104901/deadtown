var filename = argument0;
var str = "";
var file;
var file_buffer;

var ins;
var ins_num;

if !file_exists(filename)
{return 0;}

file = file_text_open_read(filename)
str = file_text_read_string(file)
file_text_close(file)
file_buffer = buffer_base64_decode(str)
buffer_save(file_buffer,filename+"_load")
buffer_delete(file_buffer)

instance_activate_all();
ini_open(filename+"_load")

// inventory
ds_map_clear(global.inven_weapon);
ds_map_clear(global.inven_equip);
ds_map_clear(global.inven_use);
ds_map_clear(global.inven_etc);

ds_map_read(global.inven_weapon,ini_read_string("inventory","weapon",""))
ds_map_read(global.inven_equip,ini_read_string("inventory","equip",""))
ds_map_read(global.inven_use,ini_read_string("inventory","use",""))
ds_map_read(global.inven_etc,ini_read_string("inventory","etc",""))

global.equip_weapon = ini_read_real("equip","weapon",-1)

global.equip_cloth = ini_read_real("equip","cloth",-1);
global.equip_hand = ini_read_real("equip","hand",-1);
global.equip_gun = ini_read_real("equip","gun",-1);
global.equip_deco = ini_read_real("equip","deco",-1);

ins = instance_create(0,0,sys_player_weapon)
ins.pointer = global.equip_weapon

ins = instance_create(0,0,sys_player_equipment)

ins.cloth_pointer = global.equip_cloth
ins.hand_pointer = global.equip_hand
ins.gun_pointer = global.equip_gun
ins.deco_pointer = global.equip_deco

// ammo
global.item_ammo_normal = ini_read_real("ammo","normal",0)
global.item_ammo_shotgun = ini_read_real("ammo","shotgun",0)
global.item_ammo_machinegun = ini_read_real("ammo","machinegun",0)
global.item_ammo_arrow = ini_read_real("ammo","arrow",0)
global.item_oil = ini_read_real("ammo","oil",0)
global.item_electric = ini_read_real("ammo","electric",0)

// rpg
global.skill_point = ini_read_real("rpg","skillpoint",0)
for (i=0;i<global.skill_db_target;i+=1)
{
    global.skill_level[i] = ini_read_real("rpg","skilllevel_"+string(i),0)
}
global.player_level = ini_read_real("rpg","playerlevel",1)
global.player_exp = ini_read_real("rpg","playerexp",0)
global.player_exp_max = ini_read_real("rpg","playerexpmax",1000)
global.player_death_count = ini_read_real("rpg","playerdeathcount",0)

// time
sys_spawn_time_light.day = ini_read_real("time","day",1)
sys_spawn_time_light.day_time = ini_read_real("time","daytime",0)
sys_spawn_time_light.weather = ini_read_real("time","weather",0)

sys_spawn_time_light.boss1_day = ini_read_real("time","boss1",0)
sys_spawn_time_light.boss2_day = ini_read_real("time","boss2",0)
sys_spawn_time_light.boss3_day = ini_read_real("time","boss3",0)
sys_spawn_time_light.boss4_day = ini_read_real("time","boss4",0)

// spawn

sys_spawn_time_light.zombie_wave1_number = ini_read_real("spawn","wave1queue",0)
sys_spawn_time_light.zombie_wave2_number = ini_read_real("spawn","wave2queue",0)
sys_spawn_time_light.zombie_wave3_number = ini_read_real("spawn","wave3queue",0)

sys_spawn_time_light.zombie_special_wave1_number = ini_read_real("spawn","specialwave1queue",0)
sys_spawn_time_light.zombie_special_wave2_number = ini_read_real("spawn","specialwave2queue",0)
sys_spawn_time_light.zombie_special_wave3_number = ini_read_real("spawn","specialwave3queue",0)

// view
sys_view.view_a = ini_read_real("view","viewa",0)

// player
obj_player.x = ini_read_real("player","x",0)
obj_player.y = ini_read_real("player","y",0)

obj_player_body.x = obj_player.x
obj_player_body.y = obj_player.y
obj_player_knife.x = obj_player.x
obj_player_knife.y = obj_player.y

obj_player.hp = ini_read_real("player","hp",0)
obj_player.hp_max = ini_read_real("player","hp_max",0)
obj_player.hungry = ini_read_real("player","hungry",0)

obj_player.player_costume = ini_read_real("player","playercostume",0)

obj_player.buff_speed = ini_read_real("player","buffspeed",0)
obj_player.buff_relax = ini_read_real("player","buffrelax",0)
obj_player.buff_painkiller = ini_read_real("player","buffpainkiller",0)
obj_player.buff_poison = ini_read_real("player","buffpoison",0)

// pet
if ini_read_real("pet","bird",0)
{
    ins = instance_create(0,0,obj_bird)
    ins.bird_type = ini_read_real("pet","birdtype",0)
}
if ini_read_real("pet","dog",0)
{
    ins = instance_create(0,0,obj_dog)
    ins.dog_type = ini_read_real("pet","dogtype",0)
}

// ------------ object ------------  //
map_obj = ds_map_create()

/// obj_bicycle
    ins_num = ini_read_real("obj_bicycle","number",0)
    for (i=0; i<ins_num; i++)
    {
        ds_map_read(map_obj,ini_read_string("obj_bicycle",string(i),""))
        ins = instance_create(0,0,obj_bicycle)
        ins.x = ds_map_find_value(map_obj,"x")
        ins.y = ds_map_find_value(map_obj,"y")
        ins.image_angle = ds_map_find_value(map_obj,"image_angle")
    }
    
/// obj_motocycle
    ins_num = ini_read_real("obj_motocycle","number",0)
    for (i=0; i<ins_num; i++)
    {
        ds_map_read(map_obj,ini_read_string("obj_motocycle",string(i),""))
        ins = instance_create(0,0,obj_motocycle)
        ins.x = ds_map_find_value(map_obj,"x")
        ins.y = ds_map_find_value(map_obj,"y")
        ins.image_angle = ds_map_find_value(map_obj,"image_angle")
    }
    
/// obj_zombie
    ins_num = ini_read_real("obj_zombie","number",0)
    for (i=0; i<ins_num; i++)
    {
        ds_map_read(map_obj,ini_read_string("obj_zombie",string(i),""))
        ins = instance_create(ds_map_find_value(map_obj,"x"),ds_map_find_value(map_obj,"y"),obj_zombie) // ** because of xstart **
        
        ins.move_speed = ds_map_find_value(map_obj,"move_speed")
        ins.image_xscale = ds_map_find_value(map_obj,"image_xscale")
        ins.image_yscale = ds_map_find_value(map_obj,"image_yscale")
        ins.feet_dis = ds_map_find_value(map_obj,"feet_dis")
        ins.foot_long = ds_map_find_value(map_obj,"foot_long")
        
        ins.image_angle = ds_map_find_value(map_obj,"image_angle")
        ins.wave_zombie = ds_map_find_value(map_obj,"wave_zombie")
        ins.hp = ds_map_find_value(map_obj,"hp")
        ins.detect = ds_map_find_value(map_obj,"detect")
        ins.my_angle = ds_map_find_value(map_obj,"my_angle")
        ins.my_angle_slow = ds_map_find_value(map_obj,"my_angle_slow")
    }
/// obj_zombie2
    ins_num = ini_read_real("obj_zombie2","number",0)
    for (i=0; i<ins_num; i++)
    {
        ds_map_read(map_obj,ini_read_string("obj_zombie2",string(i),""))
        ins = instance_create(ds_map_find_value(map_obj,"x"),ds_map_find_value(map_obj,"y"),obj_zombie2) // ** because of xstart **
        ins.image_angle = ds_map_find_value(map_obj,"image_angle")
        ins.wave_zombie = ds_map_find_value(map_obj,"wave_zombie")
        ins.hp = ds_map_find_value(map_obj,"hp")
        ins.detect = ds_map_find_value(map_obj,"detect")
        ins.my_angle = ds_map_find_value(map_obj,"my_angle")
        ins.my_angle_slow = ds_map_find_value(map_obj,"my_angle_slow")
    }
/// obj_zombie3
    ins_num = ini_read_real("obj_zombie3","number",0)
    for (i=0; i<ins_num; i++)
    {
        ds_map_read(map_obj,ini_read_string("obj_zombie3",string(i),""))
        ins = instance_create(ds_map_find_value(map_obj,"x"),ds_map_find_value(map_obj,"y"),obj_zombie3) // ** because of xstart **
        ins.image_angle = ds_map_find_value(map_obj,"image_angle")
        ins.wave_zombie = ds_map_find_value(map_obj,"wave_zombie")
        ins.hp = ds_map_find_value(map_obj,"hp")
        ins.detect = ds_map_find_value(map_obj,"detect")
        ins.my_angle = ds_map_find_value(map_obj,"my_angle")
        ins.my_angle_slow = ds_map_find_value(map_obj,"my_angle_slow")
    }
/// obj_zombie4
    ins_num = ini_read_real("obj_zombie4","number",0)
    for (i=0; i<ins_num; i++)
    {
        ds_map_read(map_obj,ini_read_string("obj_zombie4",string(i),""))
        ins = instance_create(ds_map_find_value(map_obj,"x"),ds_map_find_value(map_obj,"y"),obj_zombie4) // ** because of xstart **
        ins.image_angle = ds_map_find_value(map_obj,"image_angle")
        ins.wave_zombie = ds_map_find_value(map_obj,"wave_zombie")
        ins.hp = ds_map_find_value(map_obj,"hp")
        ins.detect = ds_map_find_value(map_obj,"detect")
        ins.my_angle = ds_map_find_value(map_obj,"my_angle")
        ins.my_angle_slow = ds_map_find_value(map_obj,"my_angle_slow")
    }
/// obj_zombie5
    ins_num = ini_read_real("obj_zombie5","number",0)
    for (i=0; i<ins_num; i++)
    {
        ds_map_read(map_obj,ini_read_string("obj_zombie5",string(i),""))
        ins = instance_create(ds_map_find_value(map_obj,"x"),ds_map_find_value(map_obj,"y"),obj_zombie5) // ** because of xstart **
        ins.image_angle = ds_map_find_value(map_obj,"image_angle")
        ins.wave_zombie = ds_map_find_value(map_obj,"wave_zombie")
        ins.hp = ds_map_find_value(map_obj,"hp")
        ins.detect = ds_map_find_value(map_obj,"detect")
        ins.my_angle = ds_map_find_value(map_obj,"my_angle")
        ins.my_angle_slow = ds_map_find_value(map_obj,"my_angle_slow")
    }
    
/// obj_craftdesk
    ins_num = ini_read_real("obj_craftdesk","number",0)
    for (i=0; i<ins_num; i++)
    {
        ds_map_read(map_obj,ini_read_string("obj_craftdesk",string(i),""))
        ins = instance_create(0,0,obj_craftdesk)
        ins.x = ds_map_find_value(map_obj,"x")
        ins.y = ds_map_find_value(map_obj,"y")
        ins.hp = ds_map_find_value(map_obj,"hp")
        ins.image_angle = ds_map_find_value(map_obj,"image_angle")
        ins.need_bettery = ds_map_find_value(map_obj,"need_bettery")
    }
    
/// obj_craftdesk_pro
    ins_num = ini_read_real("obj_craftdesk_pro","number",0)
    for (i=0; i<ins_num; i++)
    {
        ds_map_read(map_obj,ini_read_string("obj_craftdesk_pro",string(i),""))
        ins = instance_create(0,0,obj_craftdesk_pro)
        ins.x = ds_map_find_value(map_obj,"x")
        ins.y = ds_map_find_value(map_obj,"y")
        ins.hp = ds_map_find_value(map_obj,"hp")
        ins.image_angle = ds_map_find_value(map_obj,"image_angle")
        ins.need_bettery = ds_map_find_value(map_obj,"need_bettery")
    }
    
/// obj_turret
    ins_num = ini_read_real("obj_turret","number",0)
    for (i=0; i<ins_num; i++)
    {
        ds_map_read(map_obj,ini_read_string("obj_turret",string(i),""))
        ins = instance_create(0,0,obj_turret)
        ins.x = ds_map_find_value(map_obj,"x")
        ins.y = ds_map_find_value(map_obj,"y")
        ins.hp = ds_map_find_value(map_obj,"hp")
        ins.image_angle = ds_map_find_value(map_obj,"image_angle")
    }
    
/// obj_turret_move
    ins_num = ini_read_real("obj_turret_move","number",0)
    for (i=0; i<ins_num; i++)
    {
        ds_map_read(map_obj,ini_read_string("obj_turret_move",string(i),""))
        ins = instance_create(0,0,obj_turret_move)
        ins.x = ds_map_find_value(map_obj,"x")
        ins.y = ds_map_find_value(map_obj,"y")
        ins.hp = ds_map_find_value(map_obj,"hp")
        ins.image_angle = ds_map_find_value(map_obj,"image_angle")
    }
    
/// obj_lightaction
    ins_num = ini_read_real("obj_lightaction","number",0)
    for (i=0; i<ins_num; i++)
    {
        ds_map_read(map_obj,ini_read_string("obj_lightaction",string(i),""))
        ins = instance_create(0,0,obj_lightaction)
        ins.x = ds_map_find_value(map_obj,"x")
        ins.y = ds_map_find_value(map_obj,"y")
        ins.image_angle = ds_map_find_value(map_obj,"image_angle")
    }
    
/// obj_lightaction_move
    ins_num = ini_read_real("obj_lightaction_move","number",0)
    for (i=0; i<ins_num; i++)
    {
        ds_map_read(map_obj,ini_read_string("obj_lightaction_move",string(i),""))
        ins = instance_create(0,0,obj_lightaction_move)
        ins.x = ds_map_find_value(map_obj,"x")
        ins.y = ds_map_find_value(map_obj,"y")
        ins.image_angle = ds_map_find_value(map_obj,"image_angle")
    }
    
/// obj_bettery
    ins_num = ini_read_real("obj_bettery","number",0)
    for (i=0; i<ins_num; i++)
    {
        ds_map_read(map_obj,ini_read_string("obj_bettery",string(i),""))
        ins = instance_create(0,0,obj_bettery)
        ins.x = ds_map_find_value(map_obj,"x")
        ins.y = ds_map_find_value(map_obj,"y")
        ins.hp = ds_map_find_value(map_obj,"hp")
        ins.electricity = ds_map_find_value(map_obj,"electricity")
        ins.image_angle = ds_map_find_value(map_obj,"image_angle")
    }
    
/// obj_generator_solar
    ins_num = ini_read_real("obj_generator_solar","number",0)
    for (i=0; i<ins_num; i++)
    {
        ds_map_read(map_obj,ini_read_string("obj_generator_solar",string(i),""))
        ins = instance_create(0,0,obj_generator_solar)
        ins.x = ds_map_find_value(map_obj,"x")
        ins.y = ds_map_find_value(map_obj,"y")
        ins.hp = ds_map_find_value(map_obj,"hp")
        ins.image_angle = ds_map_find_value(map_obj,"image_angle")
    }
    
/// obj_generator_nuclear
    ins_num = ini_read_real("obj_generator_nuclear","number",0)
    for (i=0; i<ins_num; i++)
    {
        ds_map_read(map_obj,ini_read_string("obj_generator_nuclear",string(i),""))
        ins = instance_create(0,0,obj_generator_nuclear)
        ins.x = ds_map_find_value(map_obj,"x")
        ins.y = ds_map_find_value(map_obj,"y")
        ins.hp = ds_map_find_value(map_obj,"hp")
        ins.image_angle = ds_map_find_value(map_obj,"image_angle")
    }
    
/// obj_generator_oil
    ins_num = ini_read_real("obj_generator_oil","number",0)
    for (i=0; i<ins_num; i++)
    {
        ds_map_read(map_obj,ini_read_string("obj_generator_oil",string(i),""))
        ins = instance_create(0,0,obj_generator_oil)
        ins.x = ds_map_find_value(map_obj,"x")
        ins.y = ds_map_find_value(map_obj,"y")
        ins.hp = ds_map_find_value(map_obj,"hp")
        ins.oil = ds_map_find_value(map_obj,"oil")
        ins.image_angle = ds_map_find_value(map_obj,"image_angle")
    }
/// obj_door
    ins_num = ini_read_real("obj_door","number",0)
    for (i=0; i<ins_num; i++)
    {
        ds_map_read(map_obj,ini_read_string("obj_door",string(i),""))
        ins = instance_create(0,0,obj_door)
        ins.x = ds_map_find_value(map_obj,"x")
        ins.y = ds_map_find_value(map_obj,"y")
        ins.hp = ds_map_find_value(map_obj,"hp")
        ins.image_angle = ds_map_find_value(map_obj,"image_angle")
    }
/// obj_barricade
    ins_num = ini_read_real("obj_barricade","number",0)
    for (i=0; i<ins_num; i++)
    {
        ds_map_read(map_obj,ini_read_string("obj_barricade",string(i),""))
        ins = instance_create(0,0,obj_barricade)
        ins.x = ds_map_find_value(map_obj,"x")
        ins.y = ds_map_find_value(map_obj,"y")
        ins.hp = ds_map_find_value(map_obj,"hp")
        ins.image_angle = ds_map_find_value(map_obj,"image_angle")
    }
/// obj_iron_door
    ins_num = ini_read_real("obj_iron_door","number",0)
    for (i=0; i<ins_num; i++)
    {
        ds_map_read(map_obj,ini_read_string("obj_iron_door",string(i),""))
        ins = instance_create(0,0,obj_iron_door)
        ins.x = ds_map_find_value(map_obj,"x")
        ins.y = ds_map_find_value(map_obj,"y")
        ins.hp = ds_map_find_value(map_obj,"hp")
        ins.image_angle = ds_map_find_value(map_obj,"image_angle")
    }
/// obj_iron_barricade
    ins_num = ini_read_real("obj_iron_barricade","number",0)
    for (i=0; i<ins_num; i++)
    {
        ds_map_read(map_obj,ini_read_string("obj_iron_barricade",string(i),""))
        ins = instance_create(0,0,obj_iron_barricade)
        ins.x = ds_map_find_value(map_obj,"x")
        ins.y = ds_map_find_value(map_obj,"y")
        ins.hp = ds_map_find_value(map_obj,"hp")
        ins.image_angle = ds_map_find_value(map_obj,"image_angle")
    }
    
/// obj_campfire
    ins_num = ini_read_real("obj_campfire","number",0)
    for (i=0; i<ins_num; i++)
    {
        ds_map_read(map_obj,ini_read_string("obj_campfire",string(i),""))
        ins = instance_create(0,0,obj_campfire)
        ins.x = ds_map_find_value(map_obj,"x")
        ins.y = ds_map_find_value(map_obj,"y")
        ins.hp = ds_map_find_value(map_obj,"hp")
        ins.wood = ds_map_find_value(map_obj,"wood")
        ins.image_angle = ds_map_find_value(map_obj,"image_angle")
    }
    
/// obj_brazier
    ins_num = ini_read_real("obj_brazier","number",0)
    for (i=0; i<ins_num; i++)
    {
        ds_map_read(map_obj,ini_read_string("obj_brazier",string(i),""))
        ins = instance_create(0,0,obj_brazier)
        ins.x = ds_map_find_value(map_obj,"x")
        ins.y = ds_map_find_value(map_obj,"y")
        ins.hp = ds_map_find_value(map_obj,"hp")
        ins.wood = ds_map_find_value(map_obj,"wood")
        ins.image_angle = ds_map_find_value(map_obj,"image_angle")
    }
    
/// obj_trap_electric
    ins_num = ini_read_real("obj_trap_electric","number",0)
    for (i=0; i<ins_num; i++)
    {
        ds_map_read(map_obj,ini_read_string("obj_trap_electric",string(i),""))
        ins = instance_create(0,0,obj_trap_electric)
        ins.x = ds_map_find_value(map_obj,"x")
        ins.y = ds_map_find_value(map_obj,"y")
        ins.hp = ds_map_find_value(map_obj,"hp")
        ins.image_angle = ds_map_find_value(map_obj,"image_angle")
    }
    
/// obj_trap
    ins_num = ini_read_real("obj_trap","number",0)
    for (i=0; i<ins_num; i++)
    {
        ds_map_read(map_obj,ini_read_string("obj_trap",string(i),""))
        ins = instance_create(0,0,obj_trap)
        ins.x = ds_map_find_value(map_obj,"x")
        ins.y = ds_map_find_value(map_obj,"y")
        ins.hp = ds_map_find_value(map_obj,"hp")
        ins.image_angle = ds_map_find_value(map_obj,"image_angle")
    }

/// obj_gps
    ins_num = ini_read_real("obj_gps","number",0)
    for (i=0; i<ins_num; i++)
    {
        ds_map_read(map_obj,ini_read_string("obj_gps",string(i),""))
        ins = instance_create(0,0,obj_gps)
        ins.x = ds_map_find_value(map_obj,"x")
        ins.y = ds_map_find_value(map_obj,"y")
        ins.hp = ds_map_find_value(map_obj,"hp")
        ins.image_angle = ds_map_find_value(map_obj,"image_angle")
    }

/// obj_cooker
    ins_num = ini_read_real("obj_cooker","number",0)
    for (i=0; i<ins_num; i++)
    {
        ds_map_read(map_obj,ini_read_string("obj_cooker",string(i),""))
        ins = instance_create(0,0,obj_cooker)
        ins.x = ds_map_find_value(map_obj,"x")
        ins.y = ds_map_find_value(map_obj,"y")
        ins.hp = ds_map_find_value(map_obj,"hp")
        ins.image_angle = ds_map_find_value(map_obj,"image_angle")
    }

/// obj_brazier_electric
    ins_num = ini_read_real("obj_brazier_electric","number",0)
    for (i=0; i<ins_num; i++)
    {
        ds_map_read(map_obj,ini_read_string("obj_brazier_electric",string(i),""))
        ins = instance_create(0,0,obj_brazier_electric)
        ins.x = ds_map_find_value(map_obj,"x")
        ins.y = ds_map_find_value(map_obj,"y")
        ins.hp = ds_map_find_value(map_obj,"hp")
        ins.image_angle = ds_map_find_value(map_obj,"image_angle")
    }

/// obj_item
    ins_num = ini_read_real("obj_item","number",0)
    for (i=0; i<ins_num; i++)
    {
        ds_map_read(map_obj,ini_read_string("obj_item",string(i),""))
        ins = instance_create(0,0,obj_item)
        ins.x = ds_map_find_value(map_obj,"x")
        ins.y = ds_map_find_value(map_obj,"y")
        ins.item_type = ds_map_find_value(map_obj,"item_type")
        ins.item_index = ds_map_find_value(map_obj,"item_index")
        ins.item_number = ds_map_find_value(map_obj,"item_number")
        ins.image_angle = ds_map_find_value(map_obj,"image_angle")
    }
    
/// obj_item_building
    ins_num = ini_read_real("obj_item_building","number",0)
    for (i=0; i<ins_num; i++)
    {
        ds_map_read(map_obj,ini_read_string("obj_item_building",string(i),""))
        ins = instance_create(0,0,obj_item_building)
        ins.x = ds_map_find_value(map_obj,"x")
        ins.y = ds_map_find_value(map_obj,"y")
        ins.item_type = ds_map_find_value(map_obj,"item_type")
        ins.item_index = ds_map_find_value(map_obj,"item_index")
        ins.item_number = ds_map_find_value(map_obj,"item_number")
        ins.image_angle = ds_map_find_value(map_obj,"image_angle")
    }
    
/// obj_parcel
    ins_num = ini_read_real("obj_parcel","number",0)
    for (i=0; i<ins_num; i++)
    {
        ds_map_read(map_obj,ini_read_string("obj_parcel",string(i),""))
        ins = instance_create(0,0,obj_parcel)
        ins.x = ds_map_find_value(map_obj,"x")
        ins.y = ds_map_find_value(map_obj,"y")
        ins.image_angle = ds_map_find_value(map_obj,"image_angle")
        for(j=0;j<sys_spawn_time_light.parcel_item_number;j++)
        {
            ins.item_type[j] = ds_map_find_value(map_obj,"item_type_"+string(j))
            ins.item_index[j] = ds_map_find_value(map_obj,"item_index_"+string(j))
            ins.item_number[j] = ds_map_find_value(map_obj,"item_number_"+string(j))
            
            if is_undefined(ins.item_number[j])
            {
                ins.item_type[j] = -1
                ins.item_index[j] = -1
                ins.item_number[j] = 0
            }
        }
    }


ds_map_destroy(map_obj)
// ------------ ------ ------------  //


ini_close()
file_delete(filename+"_load")


for(i=0; i<instance_number(par_building); i++)
{
    ins = instance_find(par_building,i);
    if point_distance(ins.x,ins.y,obj_player.x,obj_player.y) < sys_spawn_time_light.item_save_dis_max
    {
        ins.item_last_day = sys_spawn_time_light.day
        ins.item_last_day_time = sys_spawn_time_light.day_time
    }
    else
    {
        ins.item_last_day = sys_spawn_time_light.day
        ins.item_last_day_time = sys_spawn_time_light.day_time - global.item_respawn_time
    }
}

deactive_auto()

return 1;
