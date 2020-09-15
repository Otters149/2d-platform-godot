extends KinematicBody2D


class_name Actor


const FLOOR_NORMAL:= Vector2.UP

export var speed: = Vector2(300, 900)
export var gravity: = 4000.0

var _velocity := Vector2.ZERO
var is_deadth: = false

func set_death(value):
	is_deadth = value
	if value:
		PlayerData.add_live(-1)
