tool
extends Node2D


export(int) var length_scale: = 1


func _ready() -> void:
	scale.y = length_scale


func _get_configuration_warning() -> String:
	return "Length scale must be greater than 0" if length_scale < 1 else ""
