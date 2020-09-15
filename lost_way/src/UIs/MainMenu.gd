extends Control


func _on_Play_button_up() -> void:
	get_tree().change_scene("res://src/UIs/ChooseLevel.tscn")


func _on_Quit_button_up() -> void:
	get_tree().quit()
