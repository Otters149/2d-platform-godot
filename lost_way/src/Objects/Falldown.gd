extends Node2D


export var speed_down := 1000.0


var origin_pos: = Vector2(0, 0)
var is_down = false


func _ready() -> void:
	origin_pos = position
	
	
func _physics_process(delta: float) -> void:
	if is_down:
		position.y += speed_down * delta
		


func _on_PlayerDetector_body_entered(body: Node) -> void:
	$AnimationPlayer.play("pre_falldown")
	yield($AnimationPlayer, "animation_finished")
	is_down = true
	$Timer.start()
	


func _on_Timer_timeout() -> void:
	is_down = false
	position = origin_pos
	$Timer.stop()
	
