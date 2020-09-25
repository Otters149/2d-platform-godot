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
				if index < season_list.size():
					season_list[index].get_node("Locker").visible = true if is_lock == "CLOCK" else false
					index += 1
		saved.close()
	
	saved.open("user://player_data.save", File.READ)
	while saved.get_position() < saved.get_len():
		var data = parse_json(saved.get_line())
		var level = str(data["level"]).split('_')
		var current_season = int(level[0])
		var current_level = int(level[1])
		
		for season_index in range(current_season - 1):
			var index_level: = 1
			while index_level <= 5:
				season_list[season_index].get_node("Line1").get_node(str(index_level)).disabled = false
				index_level += 1
			while index_level <= 10:
				season_list[season_index].get_node("Line2").get_node(str(index_level)).disabled = false
				index_level += 1
			while index_level <= 15:
				season_list[season_index].get_node("Line3").get_node(str(index_level)).disabled = false
				index_level += 1
		
		var index_level: = 1
		while index_level <= 5 and index_level <= current_level:
			season_list[current_season - 1].get_node("Container").get_node("Line1").get_node(str(index_level)).disabled = false
			index_level += 1
		while index_level <= 10 and index_level <= current_level:
			season_list[current_season - 1].get_node("Container").get_node("Line2").get_node(str(index_level)).disabled = false
			index_level += 1
		while index_level <= 15 and index_level <= current_level:
			season_list[current_season - 1].get_node("Container").get_node("Line3").get_node(str(index_level)).disabled = false
			index_level += 1		

	saved.close()

func _on_NextSeason_button_up() -> void:
	pass


func _on_PreSeason_button_up() -> void:
	pass
	
	
func enable_levels(season, level):
	pass
