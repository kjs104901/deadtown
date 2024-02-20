var PACKET_HEADER_LENGTH = 2;
var TCP_DELIMITER = '|\0\0|';
var TCP_DELIMITER_LENGTH = 4;

var sha1_size = 20;

var buffer_pointer = 0;
var crypto = require('crypto');

exports.xor_buffer = function (data){
    var key = 'pqrstuvwxyzabcdefghijklmno';
    var key_length = 26;
    for (var i=0; i<data.length; i++) {
        var key_num = key.substring(i%key_length, i%key_length+1).charCodeAt(0);
        var buf_num = data.readUInt8(i);

        data.writeUInt8(buf_num ^ key_num, i);
    }
};

exports.verify_buffer = function (data_buffer, hash_buffer) {
    var hash_sha1 = crypto.createHash('sha1');
    hash_sha1.update(data_buffer);
    var hash_buffer_get = hash_sha1.digest();

    if (hash_buffer_get.toString('hex').substring(0, sha1_size) === hash_buffer.toString())
    {return true;}
    else
    {return false;}
};

exports.buffer_pointer_reset = function (){
    buffer_pointer = 0;
};

exports.buffer_read_UInt_32 = function (buffer){
    var result = buffer.readUInt32LE(buffer_pointer);
    buffer_pointer += 4;
    return result;
};

exports.buffer_write_UInt_32 = function (buffer, value){
    var result = buffer.writeUInt32LE(value, buffer_pointer);
    buffer_pointer += 4;
    return result;
};

exports.buffer_read_UInt_16 = function (buffer){
    var result = buffer.readUInt16LE(buffer_pointer);
    buffer_pointer += 2;
    return result;
};

exports.buffer_write_UInt_16 = function (buffer, value){
    var result = buffer.writeUInt16LE(value, buffer_pointer);
    buffer_pointer += 2;
    return result;
};

exports.buffer_read_UInt_8 = function (buffer){
    var result = buffer.readUInt8(buffer_pointer);
    buffer_pointer += 1;
    return result;
};

exports.buffer_write_UInt_8 = function (buffer, value){
    var result = buffer.writeUInt8(value, buffer_pointer);
    buffer_pointer += 1;
    return result;
};

exports.buffer_read_string = function (buffer){
    var result_array = new Array();
    for(var i=0; i<buffer.length; i++){
        var temp = buffer.readUInt8(buffer_pointer);
        if (temp === 0){
            buffer_pointer += 1;
            break;
        }
        else {
            result_array.push(temp);
            buffer_pointer += 1;
        }
    }
    var result_buffer = Buffer.from(result_array);
    return result_buffer.toString();
};


exports.buffer_write_string = function (buffer, string){
    buffer.write(string, buffer_pointer);
    buffer_pointer += exports.byte_of_string(string);

    buffer.writeUInt8(0, buffer_pointer);
    buffer_pointer += 1;
};

exports.byte_of_string = function (string){
    var stringByteLength = (function(s,b,i,c){
        for(b=i=0;c=s.charCodeAt(i++);b+=c>>11?3:c>>7?2:1);
        return b
    })(string);
    return stringByteLength;
};

exports.byte_of_string_plus_null = function (string){
    var stringByteLength = exports.byte_of_string(string) + 1;
    return stringByteLength +1;
};

exports.send_packet_with_header = function (sock, send_buffer){
    var send_buffer_size = send_buffer.length;
    var temp_buffer = Buffer.alloc(PACKET_HEADER_LENGTH + send_buffer_size + TCP_DELIMITER_LENGTH);

    temp_buffer.writeUInt16LE(send_buffer_size + TCP_DELIMITER_LENGTH, 0); // header
    send_buffer.copy(temp_buffer, PACKET_HEADER_LENGTH); // data
    temp_buffer.writeUInt8(124, PACKET_HEADER_LENGTH + send_buffer_size); // delimiter
    temp_buffer.writeUInt8(0, PACKET_HEADER_LENGTH + send_buffer_size + 1);
    temp_buffer.writeUInt8(0, PACKET_HEADER_LENGTH + send_buffer_size + 2);
    temp_buffer.writeUInt8(124, PACKET_HEADER_LENGTH + send_buffer_size + 3);

    sock.write(temp_buffer);
};