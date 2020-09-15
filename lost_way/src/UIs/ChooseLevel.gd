extends Control


onready var season_list: = [$HorrorSeason]



func _ready() -> void:

	var saved = File.new()
	if not saved.file_exists("user://season_data.save"):
		return
	else:	
		saved.open("user://season_data.save", File.READ)
		while saved.get_position() < saved.get_len():
			var data = parse_json(saved.get_line())
			var index = 0
			for is_lock in data.values():
				print(is_lock)
				if index < season_list.size():
					season_list[index].get_node("Locker").visible = true if is_lock == "CLOCK" else false
					index += 1
		saved.close()
		
	saved.open("user://season_data.save", File.READ)
	while saved.get_position() < saved.get_len():
		var data = parse_json(saved.get_line())
		var level = str(data["level"]).split('_')
		var season = level[0]
		var current_level = level[1]

	saved.close()

func _on_NextSeason_button_up() -> void:
	pass


func _on_PreSeason_button_up() -> void:
	pass
	
	
func enable_levels(season, level):
	pass
