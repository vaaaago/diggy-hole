extends CharacterBody2D

var rapidez = 400
var aceleracion = 1000
var gravity = 0
var hp :int = 6 #vida del enano

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animation_tree: AnimationTree = $AnimationTree
@onready var playback = animation_tree.get("parameters/playback")
@onready var pivote: Node2D = $pivote
@onready var character_body_2d: CharacterBody2D = $"."
@export var turret1_scene : PackedScene
@export var spike_scene : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_tree.active = true


		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	#movimiento
	if Input.is_action_pressed("move_left"):
		velocity.x = move_toward(velocity.x,-rapidez,aceleracion * delta )
		pivote.scale.x = -1
	elif Input.is_action_pressed("move_right"):
		velocity.x = move_toward(velocity.x,rapidez,aceleracion * delta )
		pivote.scale.x = 1
	else:
		velocity.x = 0
	if Input.is_action_pressed("move_up"):
		velocity.y = move_toward(velocity.y,-rapidez,aceleracion * delta )
	elif Input.is_action_pressed("move_down"):
		velocity.y = move_toward(velocity.y,rapidez,aceleracion * delta )
	else:
		velocity.y = 0

	move_and_slide()

	#animation movimiento
	if abs(velocity.x) > 10 :
		playback.travel("move")
	elif abs(velocity.y) > 10 :
		playback.travel("move")
	else:
		playback.travel("idle")


		
	if Input.is_action_pressed("left_click"): #animacion para cavar
		var target_position = get_global_mouse_position() #coordenada mouse
		var posicion_enano = character_body_2d.global_position
		#obtener posicion del enano
		var distance = target_position.distance_to(posicion_enano)
		var rango_cavar = 70  # Establece tu rango de ataque
	
		if distance <= rango_cavar:
			if target_position.x - posicion_enano.x < 0:
				pivote.scale.x = -1
			elif pivote.scale.x == -1 and target_position.x - posicion_enano.x > 0 :
				pivote.scale.x = 1
			
			playback.travel("cavar")
			
			
	if Input.is_action_just_pressed("turret1"): #el input es la tecla 1
		var mouse_posi= get_global_mouse_position()
		construir(mouse_posi,"torreta1")
	
	if Input.is_action_just_pressed("turret2"): #el input es la tecla 2
		var mouse_posi= get_global_mouse_position()
		construir(mouse_posi,"spike")
		
	
		

func recibir_daño(daño:int):
	hp -= daño 
	if hp <= 0: #el enano muere
		LevelManager.game_over()
	

func construir(posicion,tipo):
	if tipo == "torreta1":
		var torreta = turret1_scene.instantiate()
		get_parent().add_child(torreta)
		torreta.global_position = posicion
		pass
	if tipo == "spike":
		var pinchos = spike_scene.instantiate()
		get_parent().add_child(pinchos)
		pinchos.global_position =  posicion
		pass
