extends CharacterBody2D

#const SPEED = 60
#var direction = 1

#@onready var ray_cast_right: RayCast2D = $RayCastRight
#@onready var ray_cast_left: RayCast2D = $RayCastLeft
#@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

@export var waypoints: Array[Marker2D]
@export var speed: float

var curr_idx = 0
var is_waiting = false
var facing_right = false
func _physics_process(delta: float) -> void:
	
	if is_waiting:
		return
	var min_dis = 5.0
	var target_position = waypoints[curr_idx].global_position
	var direction = target_position - global_position
	var distance = direction.length()
	direction = direction.normalized()
	
	if distance < min_dis:
		curr_idx +=1
		velocity = Vector2.ZERO
		$Timer.start()
		is_waiting = true
		if curr_idx == waypoints.size():
			curr_idx = 0
			
	velocity = direction * speed
	
	if (velocity.x < 0 && facing_right) or (not facing_right and velocity.x > 0):
		scale.x *= -1
		facing_right = not facing_right
		
	move_and_slide()
			

#func _process(delta: float) -> void:
#	if ray_cast_right.is_colliding():
#		direction = -1
#		animated_sprite.flip_h = false
#	if ray_cast_left.is_colliding():
#		direction = 1
#		animated_sprite.flip_h = true
#		
#	position.x += direction * SPEED * delta


func _on_timer_timeout() -> void:
	is_waiting = false
