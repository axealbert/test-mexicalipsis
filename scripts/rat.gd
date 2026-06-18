extends Area2D

@onready var timer_1: Timer = $Timer1

	


func _on_body_entered(body: Node2D) -> void:
	print("moriste por la rata")
	timer_1.start()
	



func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
