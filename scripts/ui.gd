extends CanvasLayer


@onready var coin_label = $Control/Label
@onready var key_label = $Control2/Label


func set_coins(amount):
	coin_label.text = str(amount)
	
func set_key(amount1):
	key_label.text = str(amount1)
	
