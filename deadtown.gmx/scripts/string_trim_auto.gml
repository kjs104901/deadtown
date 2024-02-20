var str = argument0;
var str_rtn = "";
var pos = 20;

if lang_type_get() == 1
{pos = 10}

if pos < string_length(str)
{
    str_rtn += string_copy(str,1,pos)
    str_rtn += string_replace(string_copy(str,pos+1,string_length(str)-pos)," ","#")
    return str_rtn;
}
else
{
    return str;
}
