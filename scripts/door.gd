extends Area2D

@onready var game_manager = %GameManager
@export var new_scene: String


var coins = 0
var keys = 0



func change_scene():
	get_tree().change_scene_to_file(new_scene)


func _on_body_entered(body: Node2D) -> void:
	print("Llegue a la puerta")
	coins = game_manager.get_coins()
	keys = game_manager.get_keys()
	
	if body.is_in_group("Jugador") and coins == 10 and keys == 1:
		change_scene()
		
	
