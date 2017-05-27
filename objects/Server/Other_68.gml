/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 2BA4706D
/// @DnDArgument : "code" "/// @description Execute Code$(13_10)var tipo_evento = ds_map_find_value(async_load,"type");$(13_10)switch (tipo_evento){$(13_10)	case network_type_connect:$(13_10)		//añade al cliente al socket del tcp$(13_10)		var socket =ds_map_find_value(async_load,"socket");$(13_10)		ds_list_add(sockets,socket);$(13_10)		with(obj_message){$(13_10)			instance_destroy();$(13_10)		}$(13_10)		var notification = instance_create_depth(0,0,1,obj_message);$(13_10)		notification.message="Se ha conectado un nuevo jugador!";$(13_10)	break;$(13_10)	case network_type_disconnect:$(13_10)		var socket=ds_map_find_value(async_load, "socket");$(13_10)		var findSocket=ds_list_find_index(sockets,socket);$(13_10)		if(findSocket>=0){$(13_10)			ds_list_delete(sockets,findSocket);$(13_10)		}$(13_10)		with(obj_message){$(13_10)			instance_destroy();$(13_10)		}$(13_10)		var notification = instance_create_depth(0,0,1,obj_message);$(13_10)		notification.message="Se ha desconectado un jugador!";$(13_10)		//codigo que reiniciaria el juego cuando un usuario se desconecta$(13_10)		//reset()$(13_10)		if(ds_queue_head(global.cola)==socket){$(13_10)			ds_queue_dequeue(global.cola);$(13_10)		}else{$(13_10)		var i=0;$(13_10)		var test;$(13_10)		if(ds_map_size(global.salas)>0){$(13_10)			while(i<ds_map_size(global.salas)){$(13_10)				test=ds_map_find_value(global.salas,i);$(13_10)				if(test.scket1==socket){$(13_10)					//aca si encuentra que el j1 se desconecto$(13_10)					i=ds_map_size(global.salas)+1; //se finaliza la busqueda$(13_10)					//codigo enviar msj de desconexion a jg 2$(13_10)					if(test.partida){$(13_10)						SacarCola(test.scket2);$(13_10)					}$(13_10)				}else{$(13_10)					if(test.scket2==socket){$(13_10)						//aca si encuentra que el j2 se desconecto$(13_10)						i=ds_map_size(global.salas)+1;		//se finaliza la busqueda$(13_10)						//codigo enviar msj de desconexion a jg 1$(13_10)						//SacarCola(scket)$(13_10)						if(test.partida){$(13_10)							SacarCola(test.scket1);$(13_10)						}$(13_10)					}else{$(13_10)						i++;	$(13_10)					}$(13_10)				}$(13_10)				}$(13_10)			}$(13_10)		}$(13_10)	break;$(13_10)	$(13_10)	case network_type_data:$(13_10)		//gestionar datos que se reciben$(13_10)		var buffer=ds_map_find_value(async_load,"buffer");$(13_10)		var socket=ds_map_find_value(async_load,"id");$(13_10)		buffer_seek(buffer, buffer_seek_start, 0);$(13_10)		src_received_buffer(buffer,socket);$(13_10)	break;$(13_10)}"
/// @description Execute Code
var tipo_evento = ds_map_find_value(async_load,"type");
switch (tipo_evento){
	case network_type_connect:
		//añade al cliente al socket del tcp
		var socket =ds_map_find_value(async_load,"socket");
		ds_list_add(sockets,socket);
		with(obj_message){
			instance_destroy();
		}
		var notification = instance_create_depth(0,0,1,obj_message);
		notification.message="Se ha conectado un nuevo jugador!";
	break;
	case network_type_disconnect:
		var socket=ds_map_find_value(async_load, "socket");
		var findSocket=ds_list_find_index(sockets,socket);
		if(findSocket>=0){
			ds_list_delete(sockets,findSocket);
		}
		with(obj_message){
			instance_destroy();
		}
		var notification = instance_create_depth(0,0,1,obj_message);
		notification.message="Se ha desconectado un jugador!";
		//codigo que reiniciaria el juego cuando un usuario se desconecta
		//reset()
		if(ds_queue_head(global.cola)==socket){
			ds_queue_dequeue(global.cola);
		}else{
		var i=0;
		var test;
		if(ds_map_size(global.salas)>0){
			while(i<ds_map_size(global.salas)){
				test=ds_map_find_value(global.salas,i);
				if(test.scket1==socket){
					//aca si encuentra que el j1 se desconecto
					i=ds_map_size(global.salas)+1; //se finaliza la busqueda
					//codigo enviar msj de desconexion a jg 2
					if(test.partida){
						SacarCola(test.scket2);
					}
				}else{
					if(test.scket2==socket){
						//aca si encuentra que el j2 se desconecto
						i=ds_map_size(global.salas)+1;		//se finaliza la busqueda
						//codigo enviar msj de desconexion a jg 1
						//SacarCola(scket)
						if(test.partida){
							SacarCola(test.scket1);
						}
					}else{
						i++;	
					}
				}
				}
			}
		}
	break;
	
	case network_type_data:
		//gestionar datos que se reciben
		var buffer=ds_map_find_value(async_load,"buffer");
		var socket=ds_map_find_value(async_load,"id");
		buffer_seek(buffer, buffer_seek_start, 0);
		src_received_buffer(buffer,socket);
	break;
}