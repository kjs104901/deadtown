var filename = "iap";
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
for(i=0; i<global.iap_index; i++)
{
    global.iap_purchase_info[i,0] = ini_read_real("iapitem",string(i),0)
}
ini_close()
file_delete(filename+"_load")

