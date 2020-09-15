extends Area2D


signal checkpoint_enter(pos)
var is_entered: = false


func _on_CheckPoint_body_entered(body: Node) -> void:
	if not is_entered:
		is_entered = true
		$AnimationPlayer.play("Entered")
		emit_signal("checkpoint_enter", position)
