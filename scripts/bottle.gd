extends Area2D

@onready var game_manager = %GameManager
@onready var animation_player = $AnimationPlayer

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Jugador"):
		game_manager.add_point()
		body.add_coins()
		animation_player.play("pickup")
		
