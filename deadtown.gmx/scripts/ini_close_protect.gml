var file;
var file_size;
var pointer;
var _byte;
var key = 69;
var value;

ini_close();

if file_exists(global._ini_name) // If the file exists, encrypt
{
    file = file_bin_open(global._ini_name, 2);
    file_size = file_bin_size(file);
    
    for (pointer = 0; pointer < file_size; pointer+=1)
    {
        file_bin_seek(file,pointer);
        value = abs(file_bin_read_byte(file)-255)+key;
        if value < 0 {value += 256}
        if value > 255 {value -= 256}
        _byte[pointer] = value
    }
    
    file_bin_rewrite(file);
    
    for (pointer = 0; pointer < file_size; pointer+=1)
    {
        file_bin_seek(file,file_size -pointer -1);
        file_bin_write_byte(file,_byte[pointer]);
    }
    
    file_bin_close(file);
}
