extends Control


func _ready() -> void:
	var saved = File.new()
	if not saved.file_exists("user://player_data.save"):
		var first_data = {
			"live": 3,
			"coin": 0,
			"level": "1_01",
			"last_time": OS.get_unix_time(),
		}
		saved.open("user://player_data.save", File.WRITE)
		saved.store_line(to_json(first_data))
		saved.close()
		
	var season_saved = File.new()
	if not season_saved.file_exists("user://season_data.save"):
		var first_data = {
			"0": "UNCLOCK",
			"1": "CLOCK",
			"2": "CLOCK",
			"3": "CLOCK",
		}
		season_saved.open("user://season_data.save", File.WRITE)
		season_saved.store_line(to_json(first_data))
		season_saved.close()


func _on_Play_button_up() -> void:
	get_tree().change_scene("res://src/UIs/ChooseLevel.tscn")


func _on_Quit_button_up() -> void:
	get_tree().quit()
