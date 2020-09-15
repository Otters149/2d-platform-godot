tool
extends TextureButton


export var scene_level: PackedScene
export var level:= ''

func _ready() -> void:
	$Label.text = level
	

func _get_configuration_warning() -> String:
	return "Level not found!?" if not scene_level else ''


func _on_LevelButton_button_up() -> void:
	get_tree().change_scene_to(scene_level)
