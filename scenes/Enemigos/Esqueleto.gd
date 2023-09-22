extends CharacterBody2D


const SPEED = 400.0
var acceleration = 1000



@onready var spriteIdle = $SpriteIdle
@onready var spriteWalk = $SpriteWalk
@onready var spriteAttack = $SpriteAttack
@onready var animation_player = $AnimationPlayer
@onready var animation_tree = $AnimationTree
@onready var playback = animation_tree.get("parameters/playback")



func attack():
	print("Attacking")
	
	
	

func _ready():
	animation_tree.active = true
	


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	
	
	if Input.is_action_pressed("debug enemy down"):
		velocity.y = move_toward(velocity.y, SPEED, acceleration*delta)
	elif Input.is_action_pressed("debug enemy up"):
		velocity.y = move_toward(velocity.y, -SPEED, acceleration*delta)
	else:
		velocity.y = 0
	if Input.is_action_pressed("debug enemy right"):
		velocity.x = move_toward(velocity.x, SPEED, acceleration*delta)
	elif Input.is_action_pressed("debug enemy left"):
		velocity.x = move_toward(velocity.x, -SPEED, acceleration*delta)
	else:
		velocity.x = 0
	if Input.is_action_just_pressed("debug enemy attack"):
		attack()
	
	
	
	move_and_slide()
	
	

	

	



	
