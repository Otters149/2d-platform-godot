extends Node2D


export (PackedScene) var Player
export var level:= '1_01'

func _ready() -> void:
	PlayerData.set_level(level)
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
