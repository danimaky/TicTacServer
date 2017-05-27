/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 2F4C25AA
/// @DnDArgument : "code" "/// @description Execute Code$(13_10)network_destroy(server);$(13_10)buffer_delete(global.buffer);$(13_10)ds_list_destroy(sockets);"
/// @description Execute Code
network_destroy(server);
buffer_delete(global.buffer);
ds_list_destroy(sockets);