extends Area2D


var is_collected: = false


func _on_Coin_body_entered(body: Node) -> void:
	if not is_collected:
		$AudioStreamPlayer2D.play()
		is_collected = true
		$CollisionShape2D.disabled = true
		$AnimationPlayer.play("collecting")
		PlayerData.add_coin(1)
