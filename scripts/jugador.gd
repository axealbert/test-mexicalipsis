extends CharacterBody2D

@onready var animation=$AnimatedSprite2D
@export var move_speed: int 
@export var jump_speed: int
@export var scene: String
var facing_right = true
const max_jump = 2
var jump_cont = 0 

var key = 0
var coins = 0
@onready var hud = get_node (scene);

func add_coins():
	coins+=1
	hud.set_coins(coins)

func add_key():
	key+=1
	hud.set_key(key)
	
	
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
	
	if is_on_floor():
		jump_cont = 0
	# Handle jump.
	if Input.is_action_just_pressed("jump") and jump_cont < max_jump:
		velocity.y = -jump_speed
		jump_cont+=1

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
	
