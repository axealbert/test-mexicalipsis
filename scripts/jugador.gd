extends CharacterBody2D

@onready var animation=$AnimatedSprite2D
@export var move_speed: int 
@export var jump_speed: int
var facing_right = true


func _physics_process(delta: float) -> void:
	
	update_animation()
	move_x()
	flip()
	jump(delta)

	

	move_and_slide()
	
	
func update_animation():
	if not is_on_floor():
		if velocity.y < 0:
			animation.play("jump")
		else:
			animation.play("fall")
		return
	
	
	if velocity.x:
		animation.play("run")
	else:
		animation.play("idle")
		
		
func jump(delta):
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_speed

	if not is_on_floor():
		velocity += get_gravity() * delta
		
func flip():
	if (velocity.x < 0 && facing_right) or (not facing_right and velocity.x > 0):
		scale.x *= -1
		facing_right = not facing_right
		animation.play("run")
	
func move_x():
	var direction := Input.get_axis("move_left", "move_right")
	velocity.x = direction * move_speed
	
