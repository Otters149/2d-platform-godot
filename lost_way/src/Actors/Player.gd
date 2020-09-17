extends Actor


export var impluse: = 1000.0


func _on_EnemyDetector_body_entered(body: KinematicBody2D) -> void:
	set_death(true)


func _on_EnemyDetector_area_entered(area: Area2D) -> void:
	_velocity.y = -impluse


func _on_DeathZoneDetector_area_entered(area: Area2D) -> void:
	set_death(true)
	

func _physics_process(delta: float) -> void:
	var direction: = get_direction()
	
	if not is_deadth:
		_velocity = calculator_velocity(_velocity, direction, speed)
		_velocity = move_and_slide(_velocity, FLOOR_NORMAL)
		
	set_animation(direction, is_deadth)


func calculator_velocity(velocity: Vector2, direction: Vector2, speed: Vector2) -> Vector2:
	var result = velocity
	result.x = direction.x * speed.x
	result.y += gravity * get_physics_process_delta_time()
	if direction.y < 0:
		result.y = direction.y * speed.y
	return result


func get_direction() -> Vector2:
#	return Vector2(
#		$Controller.right_strength - $Controller.left_strength,
#		-1.0 if $Controller.jump_strength and is_on_floor() else 1.0
#	)
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		-1.0 if Input.get_action_strength("jump") and is_on_floor() else 1.0
	)



func set_animation(direction: Vector2, is_deadth: bool) -> void:
	if is_deadth:
		when_player_die()
	else:
		if is_on_floor():
			if direction.x == 0:
				$AnimatedSprite.play("idle")
			else:
				$AnimatedSprite.play("run")
				$AnimatedSprite.flip_h = false if direction.x > 0 else true
		else:
			if direction.y < 0:
				$AnimatedSprite.play("jump")
			else:
				$AnimatedSprite.play("fall")
			if direction.x < 0:
				$AnimatedSprite.flip_h = true
			elif direction.x > 0:
				$AnimatedSprite.flip_h = false


func when_player_die():
	$Camera2D.current = false
	$AnimatedSprite.play("dead")
	$AnimationPlayer.play("death")
	yield($AnimationPlayer, "animation_finished")
