/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 513C70D4
/// @DnDArgument : "code" "/// @description Execute Code$(13_10)var socket=argument[0];$(13_10)buffer_seek(global.buffer,buffer_seek_start,0);$(13_10)			buffer_write(global.buffer,buffer_u8,5);$(13_10)			buffer_write(global.buffer,buffer_u8,1);$(13_10)			buffer_write(global.buffer,buffer_u8,0);$(13_10)			buffer_write(global.buffer,buffer_u8,0);$(13_10)			network_send_packet(socket,global.buffer,buffer_tell(global.buffer));$(13_10)http_get("http://tictac.magtdata.com/escore.php?username="+ds_map_find_value(global.usuarios,socket));			$(13_10)//BuscarPartida();"
/// @description Execute Code
var socket=argument[0];
buffer_seek(global.buffer,buffer_seek_start,0);
			buffer_write(global.buffer,buffer_u8,5);
			buffer_write(global.buffer,buffer_u8,1);
			buffer_write(global.buffer,buffer_u8,0);
			buffer_write(global.buffer,buffer_u8,0);
			network_send_packet(socket,global.buffer,buffer_tell(global.buffer));
http_get("http://tictac.magtdata.com/escore.php?username="+ds_map_find_value(global.usuarios,socket));			
//BuscarPartida();