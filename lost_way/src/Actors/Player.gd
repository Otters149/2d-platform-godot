extends Actor


export var impluse: = 1000.0
export var dust_sfx: PackedScene


var is_ground_hit: = false
var is_death: = false


func _ready() -> void:
	$Sfx/Spawn.play()


func _on_EnemyDetector_body_entered(body: KinematicBody2D) -> void:
	if not is_death:
		is_death = true
		$Sfx/Die.play()
		set_death(true)


func _on_EnemyDetector_area_entered(area: Area2D) -> void:
	$Sfx/Kill.play()
	_velocity.y = -impluse


func _on_DeathZoneDetector_area_entered(area: Area2D) -> void:
	if not is_death:
		is_death = true
		$Sfx/Die.play()
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
	# For PC
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		-1.0 if Input.get_action_strength("jump") and is_on_floor() else 1.0
	)



func set_animation(direction: Vector2, is_deadth: bool) -> void:
	if is_deadth:
		when_player_die()
	else:
		if is_on_floor():
			if is_ground_hit:
				is_ground_hit = false
				$Sfx/Ground_Hit.play()
				var dust = dust_sfx.instance()
				add_child(dust)
				dust.set_pos($Dust_position.position)
				dust.start()
				
			if direction.x == 0:
				$AnimatedSprite.play("idle")
			else:
				$AnimatedSprite.play("run")
				$AnimatedSprite.flip_h = false if direction.x > 0 else true
		else:
			if direction.y < 0:
				$Sfx/Jump.play()
				$AnimatedSprite.play("jump")
			else:
				$AnimatedSprite.play("fall")
				is_ground_hit = true
			if direction.x < 0:
				$AnimatedSprite.flip_h = true
			elif direction.x > 0:
				$AnimatedSprite.flip_h = false


func when_player_die():
	PlayingData.set_death_pos(position)
	#$Camera2D.current = false
	$AnimatedSprite.play("dead")
	$AnimationPlayer.play("death")
	yield($AnimationPlayer, "animation_finished")
