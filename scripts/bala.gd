extends Area2D

@export var velocidad_bala: float
# Called when the node enters the scene tree for the first time.
@export var dano: int = 1
@export var max_dis: float = 100.0
var dis: float = 0.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x += velocidad_bala * delta
	var mov = velocidad_bala * delta
	dis += mov
	
	if dis >= max_dis:
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("recibir_dano"):
		body.recibir_dano(dano)
		queue_free()
	elif body is TileMap or body is StaticBody2D:
		queue_free()
