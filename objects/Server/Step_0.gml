/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 1901B156
/// @DnDArgument : "code" "///// Se verifica si hay un tamaño digno de la cola $(13_10)//if(ds_queue_size(global.cola)>1){$(13_10)//	var sck1=ds_queue_head(global.cola);$(13_10)//	ds_queue_dequeue(global.cola);$(13_10)//	var sck2=ds_queue_head(global.cola);$(13_10)//	ds_queue_dequeue(global.cola);$(13_10)//	show_debug_message(string(ds_list_find_index(sockets,sck1)));$(13_10)//	if(ds_list_find_index(sockets,sck1)==-1){$(13_10)//		room_set_background_color(server_view,c_maroon,1);$(13_10)//		ds_queue_enqueue(global.cola,sck2);$(13_10)//	}else{$(13_10)//		if(ds_list_find_index(sockets,sck2)==-1){$(13_10)//			ds_queue_enqueue(global.cola,sck1);$(13_10)//		}else{$(13_10)//			var newsala=instance_create_depth(0,0,0,obj_sala);$(13_10)//			with(obj_sala){$(13_10)//			newsala.scket1=sck1;$(13_10)//			newsala.scket2=sck2;}$(13_10)//			show_debug_message("Asignado la sala "+string(global.contador));$(13_10)//			ds_map_add(global.salas,global.contador,newsala);$(13_10)//			global.contador=global.contador+1;$(13_10)//			//informar que ha salido de cola$(13_10)//			buffer_seek(global.buffer,buffer_seek_start,0);$(13_10)//			buffer_write(global.buffer,buffer_u8,3);$(13_10)//			buffer_write(global.buffer,buffer_u8,0);$(13_10)			$(13_10)//			network_send_packet(sck1,global.buffer,buffer_tell(global.buffer));$(13_10)//			buffer_seek(global.buffer,buffer_seek_start,0);$(13_10)//			buffer_write(global.buffer,buffer_u8,3);$(13_10)//			buffer_write(global.buffer,buffer_u8,1);$(13_10)//			network_send_packet(sck2,global.buffer,buffer_tell(global.buffer));$(13_10)			$(13_10)//		}$(13_10)//	}$(13_10)	$(13_10)//}"
///// Se verifica si hay un tamaño digno de la cola 
//if(ds_queue_size(global.cola)>1){
//	var sck1=ds_queue_head(global.cola);
//	ds_queue_dequeue(global.cola);
//	var sck2=ds_queue_head(global.cola);
//	ds_queue_dequeue(global.cola);
//	show_debug_message(string(ds_list_find_index(sockets,sck1)));
//	if(ds_list_find_index(sockets,sck1)==-1){
//		room_set_background_color(server_view,c_maroon,1);
//		ds_queue_enqueue(global.cola,sck2);
//	}else{
//		if(ds_list_find_index(sockets,sck2)==-1){
//			ds_queue_enqueue(global.cola,sck1);
//		}else{
//			var newsala=instance_create_depth(0,0,0,obj_sala);
//			with(obj_sala){
//			newsala.scket1=sck1;
//			newsala.scket2=sck2;}
//			show_debug_message("Asignado la sala "+string(global.contador));
//			ds_map_add(global.salas,global.contador,newsala);
//			global.contador=global.contador+1;
//			//informar que ha salido de cola
//			buffer_seek(global.buffer,buffer_seek_start,0);
//			buffer_write(global.buffer,buffer_u8,3);
//			buffer_write(global.buffer,buffer_u8,0);
			
//			network_send_packet(sck1,global.buffer,buffer_tell(global.buffer));
//			buffer_seek(global.buffer,buffer_seek_start,0);
//			buffer_write(global.buffer,buffer_u8,3);
//			buffer_write(global.buffer,buffer_u8,1);
//			network_send_packet(sck2,global.buffer,buffer_tell(global.buffer));
			
//		}
//	}
	
//}