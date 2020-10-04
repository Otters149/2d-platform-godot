
extends Area2D

signal teleporting(player)
var is_waiting: = false


func _on_Teleport_body_entered(body: Actor) -> void:
	if body != null:
		teleport(body)


func teleport(player: Actor) -> void:
	if not is_waiting:
		is_waiting = true
		$AudioStreamPlayer2D.play()
		emit_signal("teleporting", player)


func _on_Teleport_body_exited(body: Actor) -> void:
	if body != null:
		is_waiting = false


func teleported(player: Actor) -> void:
	is_waiting = true
	$AudioStreamPlayer2D.play()
	player.position = position
