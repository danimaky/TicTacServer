/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 409C7DD6
/// @DnDArgument : "code" "/// @description Execute Code$(13_10)draw_set_color(c_white);$(13_10)draw_text(5,5,"Server status: "+string(server>0));$(13_10)draw_text(5,20,"Cantidad de clientes "+string(ds_list_size(sockets)));"
/// @description Execute Code
draw_set_color(c_white);
draw_text(5,5,"Server status: "+string(server>0));
draw_text(5,20,"Cantidad de clientes "+string(ds_list_size(sockets)));