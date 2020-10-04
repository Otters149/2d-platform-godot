extends "res://src/Actors/Actor.gd"


func _ready() -> void:
	set_physics_process(false)
	_velocity.x = speed.x * -1.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	_velocity.y += gravity * delta
	if is_on_wall():
		_velocity.x *= -1.0
	set_animation(_velocity)
	_velocity.y =  move_and_slide(_velocity, FLOOR_NORMAL).y


func set_animation(direction: Vector2) -> void:
	if direction.x > 0:
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.flip_h = false


func _on_StomDetector_body_entered(body: PhysicsBody2D) -> void:
	if body != null:
		if body.global_position.y <= $StomDetector.global_position.y:
			$AnimationPlayer.play("Die")
			yield($AnimationPlayer, "animation_finished")
			queue_free()
