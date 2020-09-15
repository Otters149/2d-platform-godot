extends CanvasLayer


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
var minute: = 0
var second: = 0.0


func _ready() -> void:
	PlayerData.connect("collect_coin", self, "ui_update_coin")
	PlayerData.connect("death", self, "ui_update_live")
	
	ui_update_coin(PlayerData.get_coin())
	ui_update_live(PlayerData.get_live())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	second += delta
	if int(second) == 60:
		second = 0.0
		minute += 1
		
	$TopBar/TimeCount/MinCount.text = str(minute)
	$TopBar/TimeCount/SecCount.text = ("%02d" % int(second))


func _on_PauseButton_button_up() -> void:
	get_tree().paused = true
	$PauseMenu.visible = true


func ui_update_coin(coin):
	$TopBar/VBoxContainer/CoinCount/CoinCount.text = 'x ' + str(coin)


func ui_update_live(live):
	$TopBar/VBoxContainer/LiveCount/LiveCount.text = 'x ' + str(live)
	if live <= 0:
		$EndMenu.visible = true
		set_process(false)
