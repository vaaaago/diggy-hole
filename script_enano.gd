extends CharacterBody2D

var rapidez = 400
var aceleracion = 1000
var gravity = 0
var hp = int(3) #vida del enano
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animation_tree: AnimationTree = $AnimationTree
@onready var playback = animation_tree.get("parameters/playback")
@onready var pivote: Node2D = $pivote
@onready var character_body_2d: CharacterBody2D = $"."


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
		var target_position = get_global_mouse_position()
		var distance = position.distance_to(target_position)
		var posicion_enano = character_body_2d.global_transform.origin #obtener posicion del enano
		var rango_cavar = 100  # Establece tu rango de ataque
		if distance <= rango_cavar:
			if target_position.x - posicion_enano.x < 0:
				pivote.scale.x = -1
			elif pivote.scale.x == -1 and target_position.x - posicion_enano.x > 0 :
				pivote.scale.x = 1
			print("cavar")
			print(target_position.x - posicion_enano.x)
			playback.travel("cavar")
			
		else:
			print("fuera de rango")

