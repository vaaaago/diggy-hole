extends Area2D
var lista_enemigos = []
var disparando = false
@onready var timer = $Timer
@onready var animation_player = $Sprite2D/AnimationPlayer
@onready var animation_tree = $Sprite2D/AnimationTree
@onready var playback = animation_tree.get("parameters/playback")
var daño = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	body_entered.connect(checkear_enemigo)
	body_exited.connect(sacar_enemigo)
	
	

func _physics_process(delta):
	if lista_enemigos and not disparando:
		var posicion_enemigo= Vector2( lista_enemigos[0].global_position)
		print(posicion_enemigo)
		disparar(lista_enemigos[0])
		disparando= true
	elif not lista_enemigos:
		disparando = false
	
	
	
func disparar(body):
	playback.travel("trigger")
	if body.has_method("take_damage"): #añadir func take_damage en enemigos
		body.take_damage(daño)
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
		disparar(lista_enemigos[0])
