extends "res://src/Actors/Actor.gd"


export(float) var jump_force: = 1000.0
var is_jump: = false


func _ready() -> void:
	set_physics_process(false)
	_velocity.x = speed.x * -1.0
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if is_on_floor() and is_jump == false:
		waiting_next_jump()
		
	_velocity = calculator_velocity(_velocity, is_jump, jump_force)
		
	if is_on_wall():
		_velocity.x *= -1.0
	set_animation(_velocity)
	_velocity.y =  move_and_slide(_velocity, FLOOR_NORMAL).y
	is_jump = false

func calculator_velocity(velocity: Vector2, is_jump: bool, jump_force: float) -> Vector2:
	var result = velocity
	result.y += gravity * get_physics_process_delta_time()
	if is_jump:
		result.y = -jump_force
	return result


func waiting_next_jump() -> void:
	set_physics_process(false)
	yield(get_tree().create_timer(1), "timeout")
	is_jump = true
	set_physics_process(true)


func set_animation(direction: Vector2) -> void:
	if direction.y < 0 and is_on_floor():
		$AnimationPlayer.play("Jump")
	elif is_on_floor():
		$AnimationPlayer.stop()
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
