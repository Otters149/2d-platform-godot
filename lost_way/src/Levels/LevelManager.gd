extends Node2D


export (PackedScene) var Player
export var next_level:= '1_02'

func _ready() -> void:
	PlayerData.reset()
	PlayerData.set_level(next_level)
	PlayerData.connect("death", self, "respawn")
	
	
func respawn(live):
	if live > 0:
		yield(get_tree().create_timer(1), "timeout")
		var player_repsawn = Player.instance()
		add_child(player_repsawn)
		player_repsawn.position = $RespawnPosition.position


func update_respawn(pos: Vector2):
	$RespawnPosition.position = pos


func _on_CheckPoint_checkpoint_enter(pos) -> void:
	update_respawn(pos)


func _on_Switch_activate(structure_name: String) -> void:
	$BackObjects.get_node(structure_name).is_activate = true
