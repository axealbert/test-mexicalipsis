extends Area2D


@onready var animation_player: AnimationPlayer = $AnimationPlayer



func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Jugador"):
		body.add_guns()
		animation_player.play("pickup")
