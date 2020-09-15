extends Area2D


export var next_level: PackedScene


func _on_Gate_body_entered(body: Node) -> void:
	body.set_physics_process(false)
	next_level()


func _get_configuration_warning() -> String:
	return "Next Level Screne can't be null!" if not next_level else ""


func next_level() -> void:
	$AnimationPlayer.play("transaction")
	yield($AnimationPlayer, "animation_finished")
	get_tree().change_scene_to(next_level)


func data(file_name: String) -> Dictionary:
	var save_dict = {
		"file_name" : 'Player_Data.save',
		"coin": 0,
	}
	return save_dict


func save_data():
	pass
