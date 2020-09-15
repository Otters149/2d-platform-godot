extends Control


func _on_PlayButton_button_up() -> void:
	get_tree().paused = false
	visible = false


func _on_HomeButton_button_up() -> void:
	get_tree().paused = false
	get_tree().change_scene("res://src/UIs/MainMenu.tscn")


func _on_ReplayButton_button_up() -> void:
	PlayerData.reset()
	get_tree().paused = false
	get_tree().reload_current_scene()
