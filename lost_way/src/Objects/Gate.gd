extends Area2D


export var next_level: PackedScene


func _on_Gate_body_entered(body: Node) -> void:
	$AudioStreamPlayer2D.play()
	fire_firework()
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
		var level: = ""
		
		saved.open("user://player_data.save", File.READ)
		while saved.get_position() < saved.get_len():
			var data = parse_json(saved.get_line())
			coin = int(data["coin"])
			level = str(data["level"])
			if is_new_level(PlayerData.get_level(), level):
				level = PlayerData.get_level()
			else:
				level = level
		saved.close()
		
		var dict = format_data(3, coin + PlayerData.get_coin(), level)
		
		var save_game = File.new()
		save_game.open("user://player_data.save", File.WRITE)
		save_game.store_line(to_json(dict))
		save_game.close()
		

func is_new_level(cur_level: String, data_level: String) -> bool:
	var cur = cur_level.split("_")
	var data = data_level.split("_")
	# Compare season
	if data[0] > cur[0]:
		return false
	else:
		# Compare level
		if data[1] > cur[1]:
			return false
	return true


func random_pos() -> Vector2:
	return Vector2(rand_range(-90, 90), rand_range(0, -200))


func fire_firework():
	$Firework.visible = true
	$Firework.position = random_pos()
	$Firework.start()
	
	$Firework2.visible = true
	$Firework2.position = random_pos()
	$Firework2.start()
	
	$Firework3.visible = true
	$Firework3.position = random_pos()
	$Firework3.start()
