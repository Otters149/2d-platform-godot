extends Area2D


var is_activated: = false

func _on_PlayerDectector_body_entered(body: Actor) -> void:
	if not is_activated and body != null:
		is_activated = true
		$CountDown.play()
		$AnimationPlayer.play("activated")
		yield(get_tree().create_timer(1.5), "timeout")
		$Exploition.play()
		$AnimationPlayer.play("exploit")
		yield($AnimationPlayer, "animation_finished")
		queue_free()
