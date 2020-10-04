extends "res://src/Actors/Actor.gd"


var is_on_side: = false
var player

func _ready() -> void:
	speed.x += -1.0
	_velocity.x = speed.x

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	_velocity.y += gravity * delta
	if is_on_side:
		if (_velocity.x < 0 and player.global_position.x < global_position.x) \
		or (_velocity.x > 0 and player.global_position.x > global_position.x):
			# If not buff
			if abs(_velocity.x) <= abs(speed.x):
				$AnimationPlayer.play("Player_Detect")
				_velocity.x *= 3
			
	if is_on_wall():
		$AnimationPlayer.play("Default")
		speed.x *= -1.0
		_velocity.x = speed.x
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


func _on_PlayerDetector_body_entered(body: Node) -> void:
	player = body
	is_on_side = true


func _on_PlayerDetector_body_exited(body: Node) -> void:
	player = null
	is_on_side = false
