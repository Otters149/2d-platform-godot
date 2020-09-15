extends Node


export var live: = 3 setget ,get_live
export var coin: = 0 setget ,get_coin


var current_level: = '1_01' setget set_level, get_level


signal death(live_count)
signal collect_coin(coin_count)


func add_live(value: int) -> void:
	live += value
	emit_signal("death", live)


func add_coin(value: int) -> void:
	coin += value
	emit_signal("collect_coin", coin)


func get_live() -> int:
	return live


func get_coin() -> int:
	return coin


func get_level() -> String:
	return current_level


func set_level(value: String) -> void:
	current_level = value


func reset():
	live = 3
	coin = 0
	emit_signal("death", live)
	emit_signal("collect_coin", coin)
