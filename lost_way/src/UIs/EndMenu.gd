extends Control


func _on_HomeButton_button_up() -> void:
	get_tree().paused = false
	PlayerData.reset()
	visible = false
	get_tree().change_scene("res://src/UIs/MainMenu.tscn")


func _on_ReplayButton_button_up() -> void:
	get_tree().paused = false
	PlayerData.reset()
	get_tree().reload_current_scene()


func _on_ExitButton_button_up() -> void:
	get_tree().quit()
