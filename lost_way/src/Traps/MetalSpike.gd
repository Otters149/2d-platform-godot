extends Area2D


export var frezen_time = 0.0
var is_cycle_done = false


func _ready() -> void:
	yield(get_tree().create_timer(frezen_time), "timeout")
	is_cycle_done = true
	

func _physics_process(delta: float) -> void:
	if is_cycle_done:
		is_cycle_done = false
		run_cycle()


func run_cycle():
	$AnimationPlayer.play("sleep")
	yield($AnimationPlayer, "animation_finished")
	yield(get_tree().create_timer(2), "timeout")
	$AnimationPlayer.play("bump")
	$AudioStreamPlayer2D.play()
	yield($AnimationPlayer, "animation_finished")
	yield(get_tree().create_timer(0.5), "timeout")
	is_cycle_done = true
