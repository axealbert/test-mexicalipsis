extends CharacterBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D
@export var angle: float 
@export var length: float
@export var direction = Vector2.LEFT
var angle_rad
var player

func _ready() -> void:
	player = get_tree().get_first_node_in_group("Jugador")
	angle_rad = deg_to_rad(angle/2)
	
func _physics_process(delta: float) -> void:
	if is_in_cone():
		animated_sprite_2d.self_modulate = Color.RED
	else:
		animated_sprite_2d.self_modulate = Color.WHITE
func _draw() -> void:
	var left_dir = direction.rotated(-angle_rad)* length
	var right_dir = direction.rotated(angle_rad) * length
	draw_line(Vector2.ZERO, left_dir, Color.RED, 2.0)
	draw_line(Vector2.ZERO, right_dir, Color.RED, 2.0)

func is_in_cone():
	var player_local_pos = to_local(player.global_position)
	var dis = player_local_pos.length()
	var angle_to_player = direction.angle_to(player_local_pos)
	if dis > length:
		return false
	
	return abs(angle_to_player )<= angle_rad
		
	
