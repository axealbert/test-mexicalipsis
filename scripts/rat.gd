extends Node2D

const SPEED = 60
var direction = 1

@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D



func _process(delta: float) -> void:
	if ray_cast_right.collide_with_areas:
		direction = -1
		animated_sprite.flip_h = false
	if ray_cast_left.collide_with_areas:
		direction = 1
		animated_sprite.flip_h = true
		
	position.x += direction * SPEED * delta
