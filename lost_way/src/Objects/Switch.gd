tool
extends Area2D


export(String) var structure_name

signal activate(structure_name)

var is_activated = false

func _get_configuration_warning() -> String:
	return "Id not correct" if structure_name == "" else ""
	

func _on_Switch_body_entered(body: Node) -> void:
	if structure_name != "" and not is_activated:
		is_activated = true
		emit_signal("activate", structure_name)
		$AnimationPlayer.play("activate")
		$AudioStreamPlayer2D.play()
