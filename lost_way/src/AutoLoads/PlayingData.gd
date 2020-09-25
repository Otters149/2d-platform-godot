extends Node


var last_death_pos: = Vector2() setget set_death_pos, get_death_pos


func set_death_pos(value: Vector2) -> void:
	last_death_pos = value
	

func get_death_pos() -> Vector2:
	return last_death_pos
