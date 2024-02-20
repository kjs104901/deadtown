var net = require('net');
var bufferplus = require('./lib/bufferplus');
var room = require('./lib/room');

var PORT = 6530;
var PORT_web = 6531;

var sha1_size = 20;

var game_minimum_version = 104000;

var PACKET_HEADER_LENGTH = 2;
var TCP_DELIMITER = '|\0\0|';
var TCP_DELIMITER_LENGTH = 4;

// server live check //
var http = require('http');
http.createServer(function (req, res) {
    res.statusCode = 200;
    res.setHeader('Content-Type', 'text/plain');
    res.end('1');
    console.log('http');
}).listen(PORT_web);
console.log('Web server running at port 6531/');

net.createServer(function(sock) {
    sock.setTimeout(1000*30); // 30 seconds

    sock.player_id = '';
    sock.player_nickname = '';
    sock.player_picture = 0;

    sock.room_index = -1;
    sock.room_player_index = 0;

    var received_length = 0;

    var accumulating_buffer = Buffer.alloc(0);
    var accumulating_length = 0;

    var target_packet_length = -1;

    console.log('CONNECTED: ' + sock.remoteAddress +':'+ sock.remotePort);

    sock.on('data', function(data) {

        received_length = data.length;
        var temp_buffer = Buffer.alloc(accumulating_length + received_length);

        accumulating_buffer.copy(temp_buffer); // previous data
        data.copy(temp_buffer, accumulating_length); // new data

        accumulating_buffer = temp_buffer;
        accumulating_length += received_length;

        if (PACKET_HEADER_LENGTH < accumulating_length){
            target_packet_length = accumulating_buffer.readUInt16LE(0);
        }

        while ((0 < target_packet_length) && (PACKET_HEADER_LENGTH + target_packet_length <= accumulating_length)){
            var temp_packet_buffer = Buffer.alloc(target_packet_length);
            accumulating_buffer.copy(temp_packet_buffer, 0, PACKET_HEADER_LENGTH, accumulating_length);

            var delimiter_index = temp_packet_buffer.indexOf(TCP_DELIMITER);

            var target_packet_buffer = Buffer.alloc(delimiter_index);
            temp_packet_buffer.copy(target_packet_buffer, 0, 0, delimiter_index);

            var hash_buffer = new Buffer(sha1_size);
            var data_buffer = new Buffer(target_packet_buffer.length - sha1_size);

            target_packet_buffer.copy(hash_buffer, 0, 0, sha1_size);
            target_packet_buffer.copy(data_buffer, 0, sha1_size);

            bufferplus.xor_buffer(data_buffer);

            var verify_result = bufferplus.verify_buffer(data_buffer, hash_buffer);

            if (verify_result) {
                server_logic(sock, data_buffer);
            } else {
                console.log('failed');
            }

            accumulating_length -= (target_packet_length + PACKET_HEADER_LENGTH);
            var rebuild_buffer = Buffer.alloc(accumulating_length);
            rebuild_buffer.fill(0);
            accumulating_buffer.copy(rebuild_buffer, 0, PACKET_HEADER_LENGTH + target_packet_length);
            accumulating_buffer = rebuild_buffer;


            target_packet_length = -1;

            if (accumulating_length <= PACKET_HEADER_LENGTH){
                break;
            } else {
                target_packet_length = accumulating_buffer.readUInt16LE(0);
            }
        }
    });

    sock.on('close', function(data) {
        console.log('CLOSED: ' + sock.remoteAddress +' '+ sock.remotePort);
        room.request_room_out_with_socket(sock);
    });

    sock.on('timeout', function (data) {
        sock.destroy();
        console.log('timeout: ' + sock.remoteAddress +':'+sock.remotePort);
    });

    sock.on('error', function (data) {
        console.log('error: ' + sock.remoteAddress +':'+sock.remotePort);
    });

}).listen(PORT, function(){});

console.log('Server listening on '+ PORT);

function server_logic (sock, data_buffer){
    var callback_buffer;

    bufferplus.buffer_pointer_reset();
    var data_type = bufferplus.buffer_read_UInt_8(data_buffer);
    switch (data_type){
        case 0:
            callback_buffer = Buffer.alloc(1);
            bufferplus.buffer_pointer_reset();
            bufferplus.buffer_write_UInt_8(callback_buffer, 0);

            bufferplus.send_packet_with_header(sock, callback_buffer);
            break;
        case 1:
            console.log('version check');
            callback_buffer = Buffer.alloc(5);
            bufferplus.buffer_pointer_reset();
            bufferplus.buffer_write_UInt_8(callback_buffer, 1);
            bufferplus.buffer_write_UInt_32(callback_buffer, game_minimum_version);

            bufferplus.send_packet_with_header(sock, callback_buffer);
            break;
        case 2:
            var player_id = bufferplus.buffer_read_string(data_buffer);
            var player_nickname = bufferplus.buffer_read_string(data_buffer);
            var player_picture = bufferplus.buffer_read_UInt_8(data_buffer);

            sock.player_id = player_id;
            sock.player_nickname = player_nickname;
            sock.player_picture = player_picture;

            console.log('login: ' + sock.player_id);

            room.request_room_out_with_socket(sock);

            callback_buffer = Buffer.alloc(2);
            bufferplus.buffer_pointer_reset();
            bufferplus.buffer_write_UInt_8(callback_buffer, 2);
            bufferplus.buffer_write_UInt_8(callback_buffer, 1);

            bufferplus.send_packet_with_header(sock, callback_buffer);
            break;
        case 3:
            var room_string = room.get_room_list();
            callback_buffer = Buffer.alloc(1 + bufferplus.byte_of_string_plus_null(room_string));

            bufferplus.buffer_pointer_reset();
            bufferplus.buffer_write_UInt_8(callback_buffer, 3);
            bufferplus.buffer_write_string(callback_buffer, room_string);

            bufferplus.send_packet_with_header(sock, callback_buffer);
            break;
        case 4:
            var slot_id = bufferplus.buffer_read_string(data_buffer);
            var input_name = bufferplus.buffer_read_string(data_buffer);
            var input_pass = bufferplus.buffer_read_string(data_buffer);
            var game_type = bufferplus.buffer_read_UInt_8(data_buffer);

            var make_suc = 0;
            var make_index = 0;

            room.request_room_out_with_socket(sock);
            var make_re = room.request_room_make(input_name, slot_id, sock, 4, input_pass, game_type);
            if (make_re < 0){
                make_suc = -make_re;
                make_index = 0;
            } else {
                make_suc = 0;
                make_index = make_re;

                sock.room_index = make_re;
            }

            callback_buffer = Buffer.alloc(3);

            bufferplus.buffer_pointer_reset();
            bufferplus.buffer_write_UInt_8(callback_buffer, 4);
            bufferplus.buffer_write_UInt_8(callback_buffer, make_suc);
            bufferplus.buffer_write_UInt_8(callback_buffer, make_index);

            bufferplus.send_packet_with_header(sock, callback_buffer);
            break;
        case 5:
            var enter_room_index = bufferplus.buffer_read_UInt_8(data_buffer);
            var enter_input_pass = bufferplus.buffer_read_string(data_buffer);

            var enter_suc = 0;
            var enter_index = 0;

            var host_player_id = "";
            var host_slot_id = "";

            room.request_room_out_with_socket(sock);
            var enter_re = room.request_room_enter(enter_room_index, enter_input_pass, sock);
            if (enter_re < 0){
                enter_suc = -enter_re;
                enter_index = 0;
            } else {
                enter_suc = 0;
                enter_index = enter_re;

                sock.room_index = enter_index;

                host_player_id = room.get_host_player_id(enter_index);
                host_slot_id = room.get_host_slot_id(enter_index);
            }

            callback_buffer = Buffer.alloc(3+bufferplus.byte_of_string_plus_null(host_player_id)+bufferplus.byte_of_string_plus_null(host_slot_id)+1);

            bufferplus.buffer_pointer_reset();
            bufferplus.buffer_write_UInt_8(callback_buffer, 5);
            bufferplus.buffer_write_UInt_8(callback_buffer, enter_suc);
            bufferplus.buffer_write_UInt_8(callback_buffer, enter_index);
            bufferplus.buffer_write_string(callback_buffer, host_player_id);
            bufferplus.buffer_write_string(callback_buffer, host_slot_id);
            bufferplus.buffer_write_UInt_8(callback_buffer, sock.room_player_index);

            bufferplus.send_packet_with_header(sock, callback_buffer);

            break;
        case 6:
            room.request_room_out_with_socket(sock);

            callback_buffer = Buffer.alloc(1);

            bufferplus.buffer_pointer_reset();
            bufferplus.buffer_write_UInt_8(callback_buffer, 6);

            bufferplus.send_packet_with_header(sock, callback_buffer);
            break;
        case 7:
            var buffer_size = 2;

            var p0_socket = room.get_player_socket(sock.room_index,0);
            var p1_socket = room.get_player_socket(sock.room_index,1);
            var p2_socket = room.get_player_socket(sock.room_index,2);
            var p3_socket = room.get_player_socket(sock.room_index,3);

            if (p0_socket !== -1){
                var p0_nickname = p0_socket.player_nickname;
                var p0_picture = p0_socket.player_picture;
                buffer_size += bufferplus.byte_of_string_plus_null(p0_nickname);
                buffer_size += 1;
                buffer_size += 1;
            }
            if (p1_socket !== -1){
                var p1_nickname = p1_socket.player_nickname;
                var p1_picture = p1_socket.player_picture;
                buffer_size += bufferplus.byte_of_string_plus_null(p1_nickname);
                buffer_size += 1;
                buffer_size += 1;
            }
            if (p2_socket !== -1){
                var p2_nickname = p2_socket.player_nickname;
                var p2_picture = p2_socket.player_picture;
                buffer_size += bufferplus.byte_of_string_plus_null(p2_nickname);
                buffer_size += 1;
                buffer_size += 1;
            }
            if (p3_socket !== -1){
                var p3_nickname = p3_socket.player_nickname;
                var p3_picture = p3_socket.player_picture;
                buffer_size += bufferplus.byte_of_string_plus_null(p3_nickname);
                buffer_size += 1;
                buffer_size += 1;
            }
            var room_status = room.get_room_status(sock.room_index);
            buffer_size += 1;
            var room_game_type = room.get_room_game_type(sock.room_index);
            buffer_size += 1;
            var room_name = room.get_room_name(sock.room_index);
            buffer_size += bufferplus.byte_of_string_plus_null(room_name);

            callback_buffer = Buffer.alloc(buffer_size);

            bufferplus.buffer_pointer_reset();
            bufferplus.buffer_write_UInt_8(callback_buffer, 7);
            bufferplus.buffer_write_UInt_8(callback_buffer, room.get_room_now_number(sock.room_index));

            if (p0_socket !== -1){
                bufferplus.buffer_write_UInt_8(callback_buffer, 0);
                bufferplus.buffer_write_string(callback_buffer, p0_nickname);
                bufferplus.buffer_write_UInt_8(callback_buffer, p0_picture);
            }
            if (p1_socket !== -1){
                bufferplus.buffer_write_UInt_8(callback_buffer, 1);
                bufferplus.buffer_write_string(callback_buffer, p1_nickname);
                bufferplus.buffer_write_UInt_8(callback_buffer, p1_picture);
            }
            if (p2_socket !== -1){
                bufferplus.buffer_write_UInt_8(callback_buffer, 2);
                bufferplus.buffer_write_string(callback_buffer, p2_nickname);
                bufferplus.buffer_write_UInt_8(callback_buffer, p2_picture);
            }
            if (p3_socket !== -1){
                bufferplus.buffer_write_UInt_8(callback_buffer, 3);
                bufferplus.buffer_write_string(callback_buffer, p3_nickname);
                bufferplus.buffer_write_UInt_8(callback_buffer, p3_picture);
            }

            bufferplus.buffer_write_UInt_8(callback_buffer, room_status);
            bufferplus.buffer_write_UInt_8(callback_buffer, room_game_type);
            bufferplus.buffer_write_string(callback_buffer, room_name);

            bufferplus.send_packet_with_header(sock, callback_buffer);
            break;
        case 8:
            var start_re = room.request_room_start(sock);
            console.log(start_re);
            callback_buffer = Buffer.alloc(2);

            bufferplus.buffer_pointer_reset();
            bufferplus.buffer_write_UInt_8(callback_buffer, 8);
            bufferplus.buffer_write_UInt_8(callback_buffer, start_re);

            bufferplus.send_packet_with_header(sock, callback_buffer);
            break;
        case 11:
            var chatting_player_index = sock.room_player_index;
            var chatting_string = bufferplus.buffer_read_string(data_buffer);

            callback_buffer = Buffer.alloc(1+1+bufferplus.byte_of_string_plus_null(chatting_string));

            bufferplus.buffer_pointer_reset();
            bufferplus.buffer_write_UInt_8(callback_buffer, 11);
            bufferplus.buffer_write_UInt_8(callback_buffer, chatting_player_index);
            bufferplus.buffer_write_string(callback_buffer, chatting_string);

            room.send_packet_to_all(sock, callback_buffer);
            break;
        case 12:

            room.send_packet_to_all_except_me(sock, data_buffer);

            break;
        default:
            break;
    }
}

 bufferplus.buffer_pointer_reset();

 /*
 net = require('net');

 var clients = [];

 net.createServer(function (socket) {

 // Identify this client
 socket.name = socket.remoteAddress + ":" + socket.remotePort;

 // Put this new client in the list
 clients.push(socket);

 // Send a nice welcome message and announce
 socket.write("Welcome " + socket.name + "\n");
 broadcast(socket.name + " joined the chat\n", socket);

 // Handle incoming messages from clients.
 socket.on('data', function (data) {
 broadcast(socket.name + "> " + data, socket);
 });

 // Remove the client from the list when it leaves
 socket.on('end', function () {
 clients.splice(clients.indexOf(socket), 1);
 broadcast(socket.name + " left the chat.\n");
 });

 // Send a message to all clients
 function broadcast(message, sender) {
 clients.forEach(function (client) {
 // Don't want to send it to sender
 if (client === sender) return;
 client.write(message);
 });
 // Log it to the server output too
 process.stdout.write(message)
 }

 }).listen(5000);

 // Put a friendly message on the terminal of the server.
 console.log("Chat server running at port 5000\n");

 */