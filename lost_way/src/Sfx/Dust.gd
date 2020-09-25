extends Node2D


func set_pos(value: Vector2) -> void:
	position = value


func start() -> void:
	$AnimatedSprite.play()
	yield($AnimatedSprite, "animation_finished")
	queue_free()
