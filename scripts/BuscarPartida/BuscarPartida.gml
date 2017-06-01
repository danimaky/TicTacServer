/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 58C0B8BC
/// @DnDArgument : "code" "/// @description Execute Code$(13_10)/// Se verifica si hay un tamaño digno de la cola $(13_10)if(ds_queue_size(global.cola)>1){$(13_10)	var sck1=ds_queue_head(global.cola);$(13_10)	ds_queue_dequeue(global.cola);$(13_10)	var sck2=ds_queue_head(global.cola);$(13_10)	ds_queue_dequeue(global.cola);$(13_10)	if(ds_list_find_index(sockets,sck1)==-1){$(13_10)		room_set_background_color(server_view,c_maroon,1);$(13_10)		ds_queue_enqueue(global.cola,sck2);$(13_10)	}else{$(13_10)		if(ds_list_find_index(sockets,sck2)==-1){$(13_10)			ds_queue_enqueue(global.cola,sck1);$(13_10)		}else{$(13_10)			var newsala=instance_create_depth(0,0,0,obj_sala);$(13_10)			newsala.scket1=sck1;$(13_10)			newsala.jugador1=ds_map_find_value(global.usuarios,sck1);$(13_10)			newsala.scket2=sck2;$(13_10)			newsala.jugador2=ds_map_find_value(global.usuarios,sck2);$(13_10)			show_debug_message("Asignado la sala "+string(global.contador));$(13_10)			ds_map_add(global.salas,global.contador,newsala);$(13_10)			//informar que ha salido de cola$(13_10)			buffer_seek(global.buffer,buffer_seek_start,0);$(13_10)			//Msj ID$(13_10)			buffer_write(global.buffer,buffer_u8,3);$(13_10)			//Es  O$(13_10)			buffer_write(global.buffer,buffer_u8,0);$(13_10)			//ID de Sala$(13_10)			buffer_write(global.buffer,buffer_u8,global.contador);$(13_10)			//Adversario nickname$(13_10)			show_debug_message(string(newsala.jugador2));$(13_10)			buffer_write(global.buffer,buffer_string,newsala.jugador2);$(13_10)			network_send_packet(sck1,global.buffer,buffer_tell(global.buffer));$(13_10)			buffer_seek(global.buffer,buffer_seek_start,0);$(13_10)			//Msj ID$(13_10)			buffer_write(global.buffer,buffer_u8,3);$(13_10)			//Es X$(13_10)			buffer_write(global.buffer,buffer_u8,1);$(13_10)			//ID de Sala$(13_10)			buffer_write(global.buffer,buffer_u8,global.contador);$(13_10)			//Adversario nickname$(13_10)			buffer_write(global.buffer,buffer_string,newsala.jugador1);$(13_10)			network_send_packet(sck2,global.buffer,buffer_tell(global.buffer));$(13_10)			global.contador=global.contador+1;$(13_10)		}$(13_10)	}$(13_10)	$(13_10)}"
/// @description Execute Code
/// Se verifica si hay un tamaño digno de la cola 
if(ds_queue_size(global.cola)>1){
	var sck1=ds_queue_head(global.cola);
	ds_queue_dequeue(global.cola);
	var sck2=ds_queue_head(global.cola);
	ds_queue_dequeue(global.cola);
	if(ds_list_find_index(sockets,sck1)==-1){
		room_set_background_color(server_view,c_maroon,1);
		ds_queue_enqueue(global.cola,sck2);
	}else{
		if(ds_list_find_index(sockets,sck2)==-1){
			ds_queue_enqueue(global.cola,sck1);
		}else{
			var newsala=instance_create_depth(0,0,0,obj_sala);
			newsala.scket1=sck1;
			newsala.jugador1=ds_map_find_value(global.usuarios,sck1);
			newsala.scket2=sck2;
			newsala.jugador2=ds_map_find_value(global.usuarios,sck2);
			show_debug_message("Asignado la sala "+string(global.contador));
			ds_map_add(global.salas,global.contador,newsala);
			//informar que ha salido de cola
			buffer_seek(global.buffer,buffer_seek_start,0);
			//Msj ID
			buffer_write(global.buffer,buffer_u8,3);
			//Es  O
			buffer_write(global.buffer,buffer_u8,0);
			//ID de Sala
			buffer_write(global.buffer,buffer_u8,global.contador);
			//Adversario nickname
			show_debug_message(string(newsala.jugador2));
			buffer_write(global.buffer,buffer_string,newsala.jugador2);
			network_send_packet(sck1,global.buffer,buffer_tell(global.buffer));
			buffer_seek(global.buffer,buffer_seek_start,0);
			//Msj ID
			buffer_write(global.buffer,buffer_u8,3);
			//Es X
			buffer_write(global.buffer,buffer_u8,1);
			//ID de Sala
			buffer_write(global.buffer,buffer_u8,global.contador);
			//Adversario nickname
			buffer_write(global.buffer,buffer_string,newsala.jugador1);
			network_send_packet(sck2,global.buffer,buffer_tell(global.buffer));
			global.contador=global.contador+1;
		}
	}
	
}