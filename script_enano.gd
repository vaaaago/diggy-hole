extends CharacterBody2D

var rapidez = 400
var aceleracion = 1000
var gravity = 0
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animation_tree: AnimationTree = $AnimationTree
@onready var playback = animation_tree.get("parameters/playback")
@onready var pivote: Node2D = $pivote


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

	#animation
	if abs(velocity.x) > 10 :
		playback.travel("move")
	else:
		playback.travel("idle")
