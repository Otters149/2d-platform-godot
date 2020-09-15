extends Position2D


export var player: PackedScene
var respawn_position: = Vector2(0, 0)


func _ready() -> void:
	respawn_position = position
	PlayerData.connect("death", self, "when_player_die")


func get_pos() -> Vector2:
	return respawn_position
	
	
func set_pos(pos: Vector2) -> void:
	respawn_position = pos


func when_player_die():
	if PlayerData.get_live() > 0:
		get_tree().add_child(player)
