extends CanvasLayer


var direction:= Vector2(0, 0)
var left_strength: = 0.0
var right_strength: = 0.0
var jump_strength: = 0.0


func _ready() -> void:
	var size = OS.get_real_window_size()
	var width = get_viewport().size.x
	$Jump.position.x = width - 300


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
