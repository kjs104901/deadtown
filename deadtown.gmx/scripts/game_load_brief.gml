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

ini_open(filename+"_load")

sys_lobby.equip_weapon = ini_read_real("equip","weapon",-1)
sys_lobby.equip_cloth = ini_read_real("equip","cloth",-1);
sys_lobby.equip_hand = ini_read_real("equip","hand",-1);
sys_lobby.equip_gun = ini_read_real("equip","gun",-1);
sys_lobby.equip_deco = ini_read_real("equip","deco",-1);

sys_lobby.day = ini_read_real("time","day",1)

sys_lobby.hp = ini_read_real("player","hp",0)
sys_lobby.hungry = ini_read_real("player","hungry",0)

sys_lobby.costume = ini_read_real("player","playercostume",0)

ini_close()
file_delete(filename+"_load")
