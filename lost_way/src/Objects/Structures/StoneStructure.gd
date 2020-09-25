extends KinematicBody2D


export(float) var range_open = 200
export(float) var speed_open = 50
var is_activate = false
var origin_pos
var sound_playing = false


func _ready() -> void:
	origin_pos = position


func _physics_process(delta: float) -> void:
	if is_activate:
		$AnimationPlayer.play("activate")
		playing_sound()
		if position.y <=  origin_pos.y + range_open:
			position.y += speed_open


func playing_sound():
	if not sound_playing:
		sound_playing = true
		$AudioStreamPlayer2D.play()
