var filename = "iap";
var str = "";
var file;
var file_buffer;

if file_exists(filename)
{file_delete(filename)}

ini_open(filename)
for(i=0; i<global.iap_index; i++)
{
    ini_write_real("iapitem",string(i),global.iap_purchase_info[i,0])
}

ini_close()
file_buffer = buffer_load(filename)
file_delete(filename)
str = buffer_base64_encode(file_buffer,0,buffer_get_size(file_buffer))
file = file_text_open_write(filename)
file_text_write_string(file, str)
file_text_close(file)
buffer_delete(file_buffer)
