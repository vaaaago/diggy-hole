extends Area2D
@onready var boltspawn = $pivote/boltspawn
@export var bolt_scene: PackedScene
var lista_enemigos = []
var disparando = false
@onready var timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	body_entered.connect(checkear_enemigo)
	body_exited.connect(sacar_enemigo)
	
	

func _physics_process(delta):
	if lista_enemigos and not disparando:
		var posicion_enemigo= Vector2( lista_enemigos[0].global_position)
		print(posicion_enemigo)
		disparar(posicion_enemigo)
		disparando= true
	elif not lista_enemigos:
		disparando = false
	
	
	
func disparar(posicion):
	var bolt = bolt_scene.instantiate()
	get_parent().add_child(bolt)
	bolt.global_position = boltspawn.global_position
	bolt.rotation = boltspawn.global_position.direction_to(posicion).angle() #angulo que apunta al mouse
	timer.start(0.5) #velocidad de ataque de la torreta
	
func checkear_enemigo(body):
	if body.is_in_group("enemy"):
			# Enemigo detectado
			lista_enemigos.append(body) 
			print("detectado")

func sacar_enemigo(body):
	if body.is_in_group("enemy"):
			# Enemigo detectado
			lista_enemigos.erase(body) 
			print("enemigo salio del radio")
			
			
	

func _on_timer_timeout():
	if lista_enemigos:
		var posicion_enemigo= lista_enemigos[0].global_position
		disparar(posicion_enemigo)
