extends Area2D

@export var speed = 400
var daño= 2


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	position += transform.x * speed * delta
	
func _on_body_entered(body:Node2D): #funcion para hacer daño cuando el proyectil entra a un enemigo
	#queue_free()
	if body.has_method("take_damage"): #añadir func take_damage en enemigos
		body.take_damage(daño)
	
