extends CanvasLayer


var direction:= Vector2(0, 0)
var left_strength: = 0.0
var right_strength: = 0.0
var jump_strength: = 0.0


func _ready() -> void:
#	var width = OS.get_screen_size().x
	var width = get_viewport().size.x
	$Jump.position.x = width - 400
#	print("                 [Screen Metrics]")
#	print("            Display size: ", OS.get_screen_size())
#	print("   Decorated Window size: ", OS.get_real_window_size())
#	print("             Window size: ", OS.get_window_size())
#	print("        Project Settings: Width=", ProjectSettings.get_setting("display/window/size/width"), " Height=", ProjectSettings.get_setting("display/window/size/height")) 
#	print(OS.get_window_size().x)
#	print(OS.get_window_size().y)


func _on_Left_pressed() -> void:
	left_strength = 1


func _on_Left_released() -> void:
	left_strength = 0


func _on_Rigth_pressed() -> void:
	right_strength = 1


func _on_Rigth_released() -> void:
	right_strength = 0


func _on_Jump_pressed() -> void:
	jump_strength = 1


func _on_Jump_released() -> void:
	jump_strength = 0
