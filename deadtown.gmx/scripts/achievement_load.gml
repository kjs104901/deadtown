var filename = "achievement";
var str = "";
var file;
var file_buffer;

if file_exists(filename)
{
    file = file_text_open_read(filename)
    str = file_text_read_string(file)
    file_text_close(file)
    file_buffer = buffer_base64_decode(str)
    buffer_save(file_buffer,filename+"_load")
    buffer_delete(file_buffer)
}

ini_open(filename+"_load")

global.day_no_hit = ini_read_real("achievement","day_no_hit",0)
global.day_attract = ini_write_real("achievement","day_attract",0)

for (i=0; i<global.achievement_number; i++)
{
    global.achievement_info[i,0] = ini_read_real("achievement",string(i),0)
}


ini_close()
file_delete(filename+"_load")
