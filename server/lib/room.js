var MAX_ROOM = 100;
var bufferplus = require('./bufferplus');

var room = new Array();
for (var i=0; i<MAX_ROOM; i++) {
    room[i] = new Object();

    room[i].status = 0; // 0:없는 방 1:대기중 2:게임중
    room[i].name = '';
    room[i].game_type = 0; // 0:디펜스 1:pvp 2:생존

    room[i].host_slot_id = '';

    room[i].host_socket = -1;
    room[i].p1_socket = -1;
    room[i].p2_socket = -1;
    room[i].p3_socket = -1;

    room[i].now_number = 0;
    room[i].max_number = 0;
    room[i].password = '';
}

exports.get_room_list = function (){
    var room_list = new Array();
    var room_list_count = 0;
    for (var i=0; i<MAX_ROOM; i++) {
        if ((0 < room[i].status)){
            room_list[room_list_count] = new Object ();
            room_list[room_list_count].index = i;
            room_list[room_list_count].status = room[i].status;
            room_list[room_list_count].name = room[i].name;
            room_list[room_list_count].game_type = room[i].game_type;
            room_list[room_list_count].now_number = room[i].now_number;
            room_list[room_list_count].max_number = room[i].max_number;
            if (room[i].password === ''){
                room_list[room_list_count].password = 0;
            }
            else{
                room_list[room_list_count].password = 1;
            }
            room_list_count += 1;
        }
    }
    return JSON.stringify(room_list);
};

exports.request_room_make = function (name, host_slot_id, host_socket, max_number, password, game_type){
    var suc = 0;
    var room_make_index = 0;
    for (var i=0; i<MAX_ROOM; i++){
        if (room[i].status === 0) {
            room[i].status = 1;
            room[i].name = name;
            room[i].game_type = game_type; // 0:디펜스 1:pvp 2:생존

            room[i].host_slot_id = host_slot_id;

            room[i].host_socket = host_socket;
            room[i].p1_socket = -1;
            room[i].p2_socket = -1;
            room[i].p3_socket = -1;

            room[i].now_number = exports.get_room_now_number(i);
            room[i].max_number = max_number;
            room[i].password = password;

            suc = 1;
            room_make_index = i;
            break;
        }
    }

    if (suc) {
        host_socket.room_player_index = 0;
        return room_make_index;
    } else {
        return -1; // error code
    }
};

exports.request_room_enter = function (room_index, password, player_socket){
    var error_code = 0;

    if (room[room_index].status === 0) { // empty room
        error_code = 1;
    }

    room[room_index].now_number = exports.get_room_now_number(room_index);

    if (room[room_index].max_number <= room[room_index].now_number){ // full room
        error_code = 2;
    }

    if (room[room_index].password === password) {
        if (room[room_index].p1_socket === -1) {
            player_socket.room_player_index = 1;
            room[room_index].p1_socket = player_socket;
        } else if (room[room_index].p2_socket === -1) {
            player_socket.room_player_index = 2;
            room[room_index].p2_socket = player_socket;
        } else if (room[room_index].p3_socket === -1) {
            player_socket.room_player_index = 3;
            room[room_index].p3_socket = player_socket;
        } else { // something wrong
            error_code = 3;
        }
    } else { // password wrong
        error_code = 4;
    }

    if (error_code === 0) {
        return room_index;
    } else {
        return -error_code;
    }
};

exports.request_room_out_with_socket = function (player_socket){
    var player_id = player_socket.player_id;
    for (var i=0; i<MAX_ROOM; i++){
        if (0 < room[i].status) {
            if (room[i].host_socket.player_id === player_id){
                room[i].host_socket = -1;
                room[i].status = 0;
            }
            if (room[i].p1_socket.player_id === player_id){
                room[i].p1_socket = -1;
            }
            if (room[i].p2_socket.player_id === player_id){
                room[i].p2_socket = -1;
            }
            if (room[i].p3_socket.player_id === player_id){
                room[i].p3_socket = -1;
            }
            room[i].now_number = exports.get_room_now_number(i);
        }
    }
};

exports.request_room_start = function (player_socket){
    var suc = 0;
    var room_index = player_socket.room_index;
    if (room[room_index].status === 1) {
        if (room[room_index].host_socket === player_socket) {
            room[room_index].status = 2;
            suc = 1;
        }
    }

    return suc;
};

exports.get_room_now_number = function (room_index){
    var num = 0;
    if (room[room_index].host_socket !== -1){num += 1;}
    if (room[room_index].p1_socket !== -1){num += 1;}
    if (room[room_index].p2_socket !== -1){num += 1;}
    if (room[room_index].p3_socket !== -1){num += 1;}
    return num;
};

exports.get_host_player_id = function (room_index) {
    return room[room_index].host_socket.player_id ;
};

exports.get_host_slot_id = function (room_index) {
    return room[room_index].host_slot_id ;
};
exports.get_player_socket = function (room_index, player_room_index) {
    switch (player_room_index){
        case 0:
            return room[room_index].host_socket;
            break;
        case 1:
            return room[room_index].p1_socket;
            break;
        case 2:
            return room[room_index].p2_socket;
            break;
        case 3:
            return room[room_index].p3_socket;
            break;
    }
};

exports.get_room_name = function (room_index) {
    return room[room_index].name;
};
exports.get_room_game_type = function (room_index) {
    return room[room_index].game_type;
};
exports.get_room_status = function (room_index) {
    return room[room_index].status;
};
exports.get_room_status = function (room_index) {
    return room[room_index].status;
};

exports.send_packet_to_all = function (sock, buffer) {
    var room_index = sock.room_index;
    if (room[room_index].host_socket !== -1){
        bufferplus.send_packet_with_header(room[room_index].host_socket, buffer);
    }
    if (room[room_index].p1_socket !== -1){
        bufferplus.send_packet_with_header(room[room_index].p1_socket, buffer);
    }
    if (room[room_index].p2_socket !== -1){
        bufferplus.send_packet_with_header(room[room_index].p2_socket, buffer);
    }
    if (room[room_index].p3_socket !== -1){
        bufferplus.send_packet_with_header(room[room_index].p3_socket, buffer);
    }
};

exports.send_packet_to_all_except_me = function (sock, buffer) {
    var room_index = sock.room_index;

    if (room[room_index].host_socket !== -1){
        if (room[room_index].host_socket  !== sock){
            bufferplus.send_packet_with_header(room[room_index].host_socket, buffer);
        }
    }
    if (room[room_index].p1_socket !== -1){
        if (room[room_index].p1_socket  !== sock){
            bufferplus.send_packet_with_header(room[room_index].p1_socket, buffer);
        }
    }
    if (room[room_index].p2_socket !== -1){
        if (room[room_index].p2_socket  !== sock){
            bufferplus.send_packet_with_header(room[room_index].p2_socket, buffer);
        }
    }
    if (room[room_index].p3_socket !== -1){
        if (room[room_index].p3_socket  !== sock){
            bufferplus.send_packet_with_header(room[room_index].p3_socket, buffer);
        }
    }
};
