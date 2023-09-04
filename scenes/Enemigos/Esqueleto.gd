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
	spriteWalk.visible = false
	spriteAttack.visible = false
	spriteIdle.visible = true
	animation_tree.active = true


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	if (spriteIdle.visible) and (abs(velocity.x) >= 10 or abs(velocity.y) >= 10):
		spriteIdle.visible = false
		spriteAttack.visible = false
		spriteWalk.visible = true
		playback.travel("Walk")
	if (spriteWalk.visible) and (abs(velocity.x) <= 10 and abs(velocity.y) <= 10):
		spriteWalk.visible = false
		spriteAttack.visible = false
		spriteIdle.visible = true
		playback.travel("Idle")
	
	if Input.is_action_pressed("debug enemy down"):
		velocity.y = move_toward(velocity.y, SPEED, acceleration*delta)
	else:
		velocity.y = 0
	if Input.is_action_pressed("debug enemy right"):
		velocity.x = move_toward(velocity.x, SPEED, acceleration*delta)
	else:
		velocity.x = 0
	if Input.is_action_just_pressed("debug enemy attack"):
		attack()
	
	
	
	move_and_slide()
	
	

	

	



	
