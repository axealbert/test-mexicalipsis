extends CharacterBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D
@export var angle: float 
@export var length: float
@export var direction = Vector2.RIGHT
@export var direction2 = Vector2.LEFT
@onready var ray_cast_2d: RayCast2D = $RayCast2D
@export var speed: float
@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D
@onready var danomomia: AudioStreamPlayer2D = $danomomia



@export var vida: int = 10
var angle_rad
var player
var facing_right = false

func _ready() -> void:
	player = get_tree().get_first_node_in_group("Jugador")
	angle_rad = deg_to_rad(angle/2)
	
func recibir_dano(cantidad: int) -> void:
	
	if cantidad > 0:
		danomomia.play()
		animated_sprite_2d.self_modulate = Color.RED
	vida -= cantidad
	if vida <= 0:
		queue_free()
	
func _physics_process(delta: float) -> void:
	
	
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Ahorrar procesos físicos, cada 2 ciclos se activa el raycast
	#if Engine.get_physics_frames() % 2 != 0:
	#	return
	if is_in_cone() and has_line_of_sight():
		#animated_sprite_2d.self_modulate = Color.RED
		#if is_on_floor():
		var direction = to_local(navigation_agent_2d.get_next_path_position()).normalized()
		velocity.x = direction.x * speed
		
		if is_on_wall() and is_on_floor():
			velocity.y = -200.0
		
		if (velocity.x < 0 && facing_right) or (not facing_right and velocity.x > 0):
			animated_sprite_2d.flip_h = !animated_sprite_2d.flip_h
			facing_right = not facing_right
	
		animated_sprite_2d.play("run")
	else:
		#animated_sprite_2d.self_modulate = Color.WHITE
		animated_sprite_2d.play("idle")
		velocity.x = 0
	
	
	move_and_slide()
"""
func _draw() -> void:
	var left_dir = direction.rotated(-angle_rad)* length
	var right_dir = direction.rotated(angle_rad) * length
	draw_line(Vector2.ZERO, left_dir, Color.RED, 2.0)
	draw_line(Vector2.ZERO, right_dir, Color.RED, 2.0)
	
	var left_dir2 = direction2.rotated(-angle_rad)* length
	var right_dir2 = direction2.rotated(angle_rad) * length
	draw_line(Vector2.ZERO, left_dir2, Color.RED, 2.0)
	draw_line(Vector2.ZERO, right_dir2, Color.RED, 2.0)
"""
func is_in_cone():
	var player_local_pos = to_local(player.global_position)
	var dis = player_local_pos.length()
	var angle_to_player = direction.angle_to(player_local_pos)
	var angle_to_player2 = direction2.angle_to(player_local_pos)
	if dis > length:
		return false
	
	return abs(angle_to_player )<= angle_rad or abs(angle_to_player2) <= angle_rad
		
func has_line_of_sight():
	ray_cast_2d.target_position = to_local(player.global_position)
	#ray_cast_2d.force_raycast_update()
	var collider = ray_cast_2d.get_collider()
	
	
	if not collider:
		return false
	
	return collider.is_in_group("Jugador")
		


func _on_timer_timeout() -> void:
	navigation_agent_2d.target_position = player.global_position
