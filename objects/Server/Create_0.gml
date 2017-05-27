/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 4C6CC96E
/// @DnDArgument : "code" "/// @Inicialización del servidor$(13_10)var puerto=1232;$(13_10)var tipo=network_socket_tcp;$(13_10)var maxjugadores=32;//16 partidas$(13_10)var buffertamano=1024;$(13_10)var buffertype=buffer_fixed;$(13_10)var bufferalignment=1; $(13_10)server= network_create_server(tipo,puerto,maxjugadores);$(13_10)//se determina el buffer$(13_10)global.buffer=buffer_create(buffertamano,buffertype,bufferalignment)$(13_10)global.cola=ds_queue_create();$(13_10)global.contador=0;$(13_10)sockets=ds_list_create();$(13_10)global.salas=ds_map_create();$(13_10)with(obj_message){$(13_10)	instance_destroy();$(13_10)}$(13_10)var notification = instance_create_depth(0,0,1,obj_message);$(13_10)notification.message="El server está funcionando!";"
/// @Inicialización del servidor
var puerto=1232;
var tipo=network_socket_tcp;
var maxjugadores=32;//16 partidas
var buffertamano=1024;
var buffertype=buffer_fixed;
var bufferalignment=1; 
server= network_create_server(tipo,puerto,maxjugadores);
//se determina el buffer
global.buffer=buffer_create(buffertamano,buffertype,bufferalignment)
global.cola=ds_queue_create();
global.contador=0;
sockets=ds_list_create();
global.salas=ds_map_create();
with(obj_message){
	instance_destroy();
}
var notification = instance_create_depth(0,0,1,obj_message);
notification.message="El server está funcionando!";