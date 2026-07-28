extends CanvasLayer

@onready var gun_label = $Control/Label

func set_gun(guns):
	gun_label.text = str(guns)
