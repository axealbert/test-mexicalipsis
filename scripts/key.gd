extends Area2D

@onready var animation_player = $AnimationPlayer
@onready var game_manager = %GameManager

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Jugador"):
		body.add_key()
		game_manager.add_key_point()
		animation_player.play("pickup") 
