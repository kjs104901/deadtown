var filename = "inven";
var str = "";
var file;
var file_buffer;

if !file_exists(filename)
{return 0;}

file = file_text_open_read(filename)
str = file_text_read_string(file)
file_text_close(file)
file_buffer = buffer_base64_decode(str)
buffer_save(file_buffer,filename+"_load")
buffer_delete(file_buffer)


ini_open(filename+"_load")
global.money = ini_read_real("money","money",0)
for(i=0; i<global.shop_db_index; i++)
{
    global.shop_db[i,5] = ini_read_real("shopitem",string(i),0)
}
ini_close()
file_delete(filename+"_load")

