extends Node2D


export var is_vertical: = false
export var is_horizontal: = true
export var x_range: = 500.0
export var y_range: = 500.0
export var speed: = Vector2(300, 300)


var origin_pos: = Vector2(0, 0)
var actor
var origin_gravity: = 1000.0

func _ready() -> void:
	origin_pos = position
	actor = null


func _physics_process(delta: float) -> void:
	speed = when_out_of_range(x_range, y_range, speed)
	
	if is_horizontal:
		position.x += speed.x * delta
		if actor != null:
			actor.position.x += speed.x * delta
	
	if is_vertical:
		if actor != null:
			actor.position.y += speed.y * delta
		position.y += speed.y * delta



func when_out_of_range(x_range: float, y_range: float, origin_speed: Vector2) -> Vector2:
	if x_range < 0:
		if (position.x < origin_pos.x + x_range) or (position.x > origin_pos.x):
			origin_speed.x *= -1
	else:
		if (position.x > origin_pos.x + x_range) or (position.x < origin_pos.x):
			origin_speed.x *= -1
	
	if y_range < 0:
		if (position.y < origin_pos.y + y_range) or (position.y > origin_pos.y):
			origin_speed.y *= -1
				
	else:
		if (position.y > origin_pos.y + y_range) or (position.y < origin_pos.y):
			origin_speed.y *= -1
			
	return origin_speed


func _on_ActorDetector_body_entered(body: Actor) -> void:
	if body != null:
		actor = body


func _on_ActorDetector_body_exited(body: Actor) -> void:
	actor = null
