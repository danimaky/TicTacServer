/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 71987FA3
/// @DnDArgument : "code" "/// src_received_buffer(buffer)$(13_10)var buffer=argument[0];$(13_10)var socket=argument[1];$(13_10)var msgId=buffer_read(buffer,buffer_u8);$(13_10)switch(msgId){$(13_10)	case 1:$(13_10)		var clientTime=buffer_read(buffer,buffer_u32);$(13_10)		buffer_seek(global.buffer,buffer_seek_start,0);$(13_10)		//latency=ClientTimelater-clientTime$(13_10)		//msgId=1$(13_10)		buffer_write(global.buffer,buffer_u8, msgId);$(13_10)		buffer_write(global.buffer,buffer_u32,clientTime);$(13_10)		//le devolvemos el ping$(13_10)		network_send_packet(socket,global.buffer,buffer_tell(global.buffer));$(13_10)	break;$(13_10)	//solicitar entrar en cola$(13_10)	case 2:$(13_10)		ds_queue_enqueue(global.cola,socket);$(13_10)		buffer_seek(global.buffer,buffer_seek_start,0);$(13_10)		buffer_write(global.buffer,buffer_u8,msgId);$(13_10)		network_send_packet(socket,global.buffer,buffer_tell(global.buffer));$(13_10)		BuscarPartida();$(13_10)	break;$(13_10)	//sacar de cola y meterlo en partida$(13_10)	case 3:$(13_10)	break;$(13_10)	//sacar de partida al amiguito$(13_10)	case 4:$(13_10)	break;$(13_10)	//Ingresar jugada -or hacer$(13_10)	case 5:$(13_10)		//id de sala$(13_10)		var salapartida=buffer_read(buffer,buffer_u8);$(13_10)		//opcion O$(13_10)		var opcion = buffer_read(buffer,buffer_u8);$(13_10)		//id de caja$(13_10)		var caja=buffer_read(buffer,buffer_u8);$(13_10)		//buscar sala del asociado$(13_10)		salapartida=ds_map_find_value(global.salas,salapartida);$(13_10)		//recibir jugada y registrarla en la sala$(13_10)		if(salapartida.cajas[caja]=""){$(13_10)		if(opcion==0){$(13_10)			salapartida.cajas[caja]="O";$(13_10)		}else{$(13_10)			salapartida.cajas[caja]="X";$(13_10)		}$(13_10)		salapartida.jugadas++;$(13_10)		var resultado;$(13_10)		if(salapartida.cajas[caja]=salapartida.cajas[0]&&salapartida.cajas[caja]=salapartida.cajas[1]&&salapartida.cajas[caja]=salapartida.cajas[2]){$(13_10)			//victoria a quien esta enviando$(13_10)			resultado=1;$(13_10)		}else{$(13_10)			if(salapartida.cajas[caja]=salapartida.cajas[3]&&salapartida.cajas[caja]=salapartida.cajas[4]&&salapartida.cajas[caja]=salapartida.cajas[5]){$(13_10)				//Victoria a quien esta enviando$(13_10)				resultado=1;$(13_10)			}else{$(13_10)				if(salapartida.cajas[caja]=salapartida.cajas[6]&&salapartida.cajas[caja]=salapartida.cajas[7]&&salapartida.cajas[caja]=salapartida.cajas[8]){$(13_10)					//Victoria a quien esta enviando$(13_10)					resultado=1;$(13_10)				}else{$(13_10)					if(salapartida.cajas[caja]=salapartida.cajas[0]&&salapartida.cajas[caja]=salapartida.cajas[3]&&salapartida.cajas[caja]=salapartida.cajas[6]){$(13_10)						//Victoria a quien esta enviando$(13_10)						resultado=1;$(13_10)					}else{$(13_10)						if(salapartida.cajas[caja]=salapartida.cajas[1]&&salapartida.cajas[caja]=salapartida.cajas[4]&&salapartida.cajas[caja]=salapartida.cajas[7]){$(13_10)							//Victoria a quien envia$(13_10)							resultado=1;$(13_10)						}else{$(13_10)							if(salapartida.cajas[caja]=salapartida.cajas[2]&&salapartida.cajas[caja]=salapartida.cajas[5]&&salapartida.cajas[caja]=salapartida.cajas[8]){$(13_10)								//Victoria a quien envia$(13_10)								resultado=1;$(13_10)							}else{$(13_10)								if(salapartida.cajas[caja]=salapartida.cajas[6]&&salapartida.cajas[caja]=salapartida.cajas[4]&&salapartida.cajas[caja]=salapartida.cajas[2]){$(13_10)									//Victoria a quien envia$(13_10)									resultado=1;$(13_10)								}else{$(13_10)									if(salapartida.cajas[caja]=salapartida.cajas[8]&&salapartida.cajas[caja]=salapartida.cajas[4]&&salapartida.cajas[caja]=salapartida.cajas[0]){$(13_10)										//Victoria a quien envia$(13_10)										resultado=1;$(13_10)									}else{$(13_10)										//ninguno de los ganó$(13_10)										if(salapartida.jugadas==9){$(13_10)											resultado=3;$(13_10)											salapartida.partida=false;$(13_10)											//Empate$(13_10)											//enviar fin$(13_10)										}else{$(13_10)											resultado=0;$(13_10)											//enviar nomas$(13_10)										}$(13_10)									}$(13_10)								}$(13_10)							}$(13_10)						}$(13_10)					}$(13_10)				}$(13_10)			}$(13_10)		}$(13_10)		if(salapartida.cajas[caja]="O"){$(13_10)			//scket1 jugó$(13_10)			if(resultado=1){$(13_10)				http_get("http://tictac.magtdata.com/escore.php?username="+salapartida.jugador1);$(13_10)			}$(13_10)			buffer_seek(global.buffer,buffer_seek_start,0);$(13_10)			buffer_write(global.buffer,buffer_u8,msgId);$(13_10)			buffer_write(global.buffer,buffer_u8,resultado);$(13_10)			buffer_write(global.buffer,buffer_u8,0);$(13_10)			buffer_write(global.buffer,buffer_u8,caja);$(13_10)			network_send_packet(salapartida.scket1,global.buffer,buffer_tell(global.buffer));$(13_10)			buffer_seek(global.buffer,buffer_seek_start,0);$(13_10)			buffer_write(global.buffer,buffer_u8,msgId);$(13_10)			if(resultado==0||resultado==3){$(13_10)			buffer_write(global.buffer,buffer_u8,resultado);}else{$(13_10)				buffer_write(global.buffer,buffer_u8,2);$(13_10)				salapartida.partida=false;$(13_10)			}$(13_10)			buffer_write(global.buffer,buffer_u8,1);$(13_10)			buffer_write(global.buffer,buffer_u8,caja);$(13_10)			show_debug_message("paso por aca bien");$(13_10)			network_send_packet(salapartida.scket2,global.buffer,buffer_tell(global.buffer));$(13_10)		}else{$(13_10)			//scket2 jugó$(13_10)			if(resultado=1){$(13_10)				http_get("http://tictac.magtdata.com/escore.php?username="+salapartida.jugador2);$(13_10)			}$(13_10)			buffer_seek(global.buffer,buffer_seek_start,0);$(13_10)			buffer_write(global.buffer,buffer_u8,msgId);$(13_10)			if(resultado==0||resultado==3){$(13_10)			buffer_write(global.buffer,buffer_u8,resultado);}else{$(13_10)				buffer_write(global.buffer,buffer_u8,2);salapartida.partida=false;$(13_10)			}$(13_10)			buffer_write(global.buffer,buffer_u8,1);$(13_10)			buffer_write(global.buffer,buffer_u8,caja);$(13_10)			network_send_packet(salapartida.scket1,global.buffer,buffer_tell(global.buffer));$(13_10)			buffer_seek(global.buffer,buffer_seek_start,0);$(13_10)			buffer_write(global.buffer,buffer_u8,msgId);$(13_10)			buffer_write(global.buffer,buffer_u8,resultado);$(13_10)			buffer_write(global.buffer,buffer_u8,0);$(13_10)			buffer_write(global.buffer,buffer_u8,caja);$(13_10)			show_debug_message("paso por aca");$(13_10)			network_send_packet(salapartida.scket2,global.buffer,buffer_tell(global.buffer));$(13_10)		}}else{$(13_10)			buffer_seek(global.buffer,buffer_seek_start,0);$(13_10)			buffer_write(global.buffer,buffer_u8,msgId);$(13_10)			buffer_write(global.buffer,buffer_u8,0);$(13_10)			if(opcion==0){$(13_10)				buffer_write(global.buffer,buffer_u8,1);$(13_10)			}else{$(13_10)				buffer_write(global.buffer,buffer_u8,0);$(13_10)			}$(13_10)			buffer_write(global.buffer,buffer_u8,caja);$(13_10)			network_send_packet(socket,global.buffer,buffer_tell(global.buffer));$(13_10)		}$(13_10)		//decidir victoria/empate$(13_10)		//enviar jugar o finalizar$(13_10)	break;$(13_10)	//registrar en lista$(13_10)	case 6:$(13_10)		var nickname=buffer_read(buffer,buffer_string);$(13_10)		show_debug_message("Se recibio el nickname "+nickname);$(13_10)		ds_map_add(global.usuarios,socket,nickname);$(13_10)		//conectado$(13_10)		http_get("http://tictac.magtdata.com/estado.php?username="+nickname+"&estado=true");$(13_10)	break;$(13_10)}"
/// src_received_buffer(buffer)
var buffer=argument[0];
var socket=argument[1];
var msgId=buffer_read(buffer,buffer_u8);
switch(msgId){
	case 1:
		var clientTime=buffer_read(buffer,buffer_u32);
		buffer_seek(global.buffer,buffer_seek_start,0);
		//latency=ClientTimelater-clientTime
		//msgId=1
		buffer_write(global.buffer,buffer_u8, msgId);
		buffer_write(global.buffer,buffer_u32,clientTime);
		//le devolvemos el ping
		network_send_packet(socket,global.buffer,buffer_tell(global.buffer));
	break;
	//solicitar entrar en cola
	case 2:
		ds_queue_enqueue(global.cola,socket);
		buffer_seek(global.buffer,buffer_seek_start,0);
		buffer_write(global.buffer,buffer_u8,msgId);
		network_send_packet(socket,global.buffer,buffer_tell(global.buffer));
		BuscarPartida();
	break;
	//sacar de cola y meterlo en partida
	case 3:
	break;
	//sacar de partida al amiguito
	case 4:
	break;
	//Ingresar jugada -or hacer
	case 5:
		//id de sala
		var salapartida=buffer_read(buffer,buffer_u8);
		//opcion O
		var opcion = buffer_read(buffer,buffer_u8);
		//id de caja
		var caja=buffer_read(buffer,buffer_u8);
		//buscar sala del asociado
		salapartida=ds_map_find_value(global.salas,salapartida);
		//recibir jugada y registrarla en la sala
		if(salapartida.cajas[caja]=""){
		if(opcion==0){
			salapartida.cajas[caja]="O";
		}else{
			salapartida.cajas[caja]="X";
		}
		salapartida.jugadas++;
		var resultado;
		if(salapartida.cajas[caja]=salapartida.cajas[0]&&salapartida.cajas[caja]=salapartida.cajas[1]&&salapartida.cajas[caja]=salapartida.cajas[2]){
			//victoria a quien esta enviando
			resultado=1;
		}else{
			if(salapartida.cajas[caja]=salapartida.cajas[3]&&salapartida.cajas[caja]=salapartida.cajas[4]&&salapartida.cajas[caja]=salapartida.cajas[5]){
				//Victoria a quien esta enviando
				resultado=1;
			}else{
				if(salapartida.cajas[caja]=salapartida.cajas[6]&&salapartida.cajas[caja]=salapartida.cajas[7]&&salapartida.cajas[caja]=salapartida.cajas[8]){
					//Victoria a quien esta enviando
					resultado=1;
				}else{
					if(salapartida.cajas[caja]=salapartida.cajas[0]&&salapartida.cajas[caja]=salapartida.cajas[3]&&salapartida.cajas[caja]=salapartida.cajas[6]){
						//Victoria a quien esta enviando
						resultado=1;
					}else{
						if(salapartida.cajas[caja]=salapartida.cajas[1]&&salapartida.cajas[caja]=salapartida.cajas[4]&&salapartida.cajas[caja]=salapartida.cajas[7]){
							//Victoria a quien envia
							resultado=1;
						}else{
							if(salapartida.cajas[caja]=salapartida.cajas[2]&&salapartida.cajas[caja]=salapartida.cajas[5]&&salapartida.cajas[caja]=salapartida.cajas[8]){
								//Victoria a quien envia
								resultado=1;
							}else{
								if(salapartida.cajas[caja]=salapartida.cajas[6]&&salapartida.cajas[caja]=salapartida.cajas[4]&&salapartida.cajas[caja]=salapartida.cajas[2]){
									//Victoria a quien envia
									resultado=1;
								}else{
									if(salapartida.cajas[caja]=salapartida.cajas[8]&&salapartida.cajas[caja]=salapartida.cajas[4]&&salapartida.cajas[caja]=salapartida.cajas[0]){
										//Victoria a quien envia
										resultado=1;
									}else{
										//ninguno de los ganó
										if(salapartida.jugadas==9){
											resultado=3;
											salapartida.partida=false;
											//Empate
											//enviar fin
										}else{
											resultado=0;
											//enviar nomas
										}
									}
								}
							}
						}
					}
				}
			}
		}
		if(salapartida.cajas[caja]="O"){
			//scket1 jugó
			if(resultado=1){
				http_get("http://tictac.magtdata.com/escore.php?username="+salapartida.jugador1);
			}
			buffer_seek(global.buffer,buffer_seek_start,0);
			buffer_write(global.buffer,buffer_u8,msgId);
			buffer_write(global.buffer,buffer_u8,resultado);
			buffer_write(global.buffer,buffer_u8,0);
			buffer_write(global.buffer,buffer_u8,caja);
			network_send_packet(salapartida.scket1,global.buffer,buffer_tell(global.buffer));
			buffer_seek(global.buffer,buffer_seek_start,0);
			buffer_write(global.buffer,buffer_u8,msgId);
			if(resultado==0||resultado==3){
			buffer_write(global.buffer,buffer_u8,resultado);}else{
				buffer_write(global.buffer,buffer_u8,2);
				salapartida.partida=false;
			}
			buffer_write(global.buffer,buffer_u8,1);
			buffer_write(global.buffer,buffer_u8,caja);
			show_debug_message("paso por aca bien");
			network_send_packet(salapartida.scket2,global.buffer,buffer_tell(global.buffer));
		}else{
			//scket2 jugó
			if(resultado=1){
				http_get("http://tictac.magtdata.com/escore.php?username="+salapartida.jugador2);
			}
			buffer_seek(global.buffer,buffer_seek_start,0);
			buffer_write(global.buffer,buffer_u8,msgId);
			if(resultado==0||resultado==3){
			buffer_write(global.buffer,buffer_u8,resultado);}else{
				buffer_write(global.buffer,buffer_u8,2);salapartida.partida=false;
			}
			buffer_write(global.buffer,buffer_u8,1);
			buffer_write(global.buffer,buffer_u8,caja);
			network_send_packet(salapartida.scket1,global.buffer,buffer_tell(global.buffer));
			buffer_seek(global.buffer,buffer_seek_start,0);
			buffer_write(global.buffer,buffer_u8,msgId);
			buffer_write(global.buffer,buffer_u8,resultado);
			buffer_write(global.buffer,buffer_u8,0);
			buffer_write(global.buffer,buffer_u8,caja);
			show_debug_message("paso por aca");
			network_send_packet(salapartida.scket2,global.buffer,buffer_tell(global.buffer));
		}}else{
			buffer_seek(global.buffer,buffer_seek_start,0);
			buffer_write(global.buffer,buffer_u8,msgId);
			buffer_write(global.buffer,buffer_u8,0);
			if(opcion==0){
				buffer_write(global.buffer,buffer_u8,1);
			}else{
				buffer_write(global.buffer,buffer_u8,0);
			}
			buffer_write(global.buffer,buffer_u8,caja);
			network_send_packet(socket,global.buffer,buffer_tell(global.buffer));
		}
		//decidir victoria/empate
		//enviar jugar o finalizar
	break;
	//registrar en lista
	case 6:
		var nickname=buffer_read(buffer,buffer_string);
		show_debug_message("Se recibio el nickname "+nickname);
		ds_map_add(global.usuarios,socket,nickname);
		//conectado
		http_get("http://tictac.magtdata.com/estado.php?username="+nickname+"&estado=true");
	break;
}