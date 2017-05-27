/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 735ABA94
/// @DnDArgument : "code" "/// @description Execute Code$(13_10)if(alpha>0){$(13_10)	alpha-=0.005;$(13_10)}else{$(13_10)	instance_destroy();$(13_10)}"
/// @description Execute Code
if(alpha>0){
	alpha-=0.005;
}else{
	instance_destroy();
}