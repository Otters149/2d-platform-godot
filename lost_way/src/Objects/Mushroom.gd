extends KinematicBody2D

export var impluse: = -2000.0


func _on_PlayerDetector_body_entered(body: Actor) -> void:
	if body != null:
		$AudioStreamPlayer2D.play()
		body._velocity.y = impluse
