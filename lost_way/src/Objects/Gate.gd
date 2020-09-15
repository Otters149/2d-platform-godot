extends Area2D


export var next_level: PackedScene


func _on_Gate_body_entered(body: Node) -> void:
	body.set_physics_process(false)
	save_data()
	next_level()


func _get_configuration_warning() -> String:
	return "Next Level Screne can't be null!" if not next_level else ""


func next_level() -> void:
	$AnimationPlayer.play("transaction")
	yield($AnimationPlayer, "animation_finished")
	get_tree().change_scene_to(next_level)


func format_data(live: int, coin: int, level: String) -> Dictionary:
	var save_dict = {
		"live": live,
		"coin": coin,
		"level": level,
		"last_time": OS.get_unix_time(),
	}
	return save_dict


func save_data():
	var saved = File.new()
	if not saved.file_exists("user://player_data.save"):
		return
	else:
		var coin := 0
		
		saved.open("user://player_data.save", File.READ)
		while saved.get_position() < saved.get_len():
			var data = parse_json(saved.get_line())
			coin = int(data["coin"])
		saved.close()
		
		var dict = format_data(3, coin + PlayerData.get_coin(), PlayerData.get_level())
		print( coin + PlayerData.get_coin())
		
		var save_game = File.new()
		save_game.open("user://player_data.save", File.WRITE)
		save_game.store_line(to_json(dict))
		save_game.close()
		
