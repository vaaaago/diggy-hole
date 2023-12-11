extends Area2D

@export var speed = 400
var daño= 2


# Called when the node enters the scene tree for the first time.
func _ready():
	body_entered.connect(dañar)


func _physics_process(delta):
	position += transform.x * speed * delta
	
func dañar(body:Node2D): #funcion para hacer daño cuando el proyectil entra a un enemigo
	if body.has_method("take_damage"): #añadir func take_damage en enemigos
		body.take_damage(daño)
	queue_free()
	
