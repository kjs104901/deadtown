var playerlist = new Array();

exports.add_new_player = function (socket, player_id){
    playerlist[socket] = player_id;
}

exports.delete_player_with_socket = function (socket){
    playerlist[socket] = "";
}

exports.get_player_id_with_socket = function (socket){
    return playerlist[socket];
}
