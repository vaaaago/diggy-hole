extends CharacterBody2D


const SPEED = 100.0
var acceleration = 200
var hp = 3
var attacking = false
var damage = 2

@export var movement_target: Node2D
@export var navigation_agent: NavigationAgent2D





@onready var animation_player = $AnimationPlayer
@onready var animation_tree = $AnimationTree
@onready var playback = animation_tree.get("parameters/playback")
@onready var sprite2d = $Sprite2D
@onready var attack_sound = $Ataque




func _ready():
	animation_tree.active = true
	navigation_agent.path_desired_distance = 16
	navigation_agent.target_desired_distance = 58.0
	
	
	call_deferred("actor_setup")

func _physics_process(delta):
	
	set_movement_target(movement_target.position)
	var current_agent_position: Vector2 = global_position
	var next_path_position: Vector2 = navigation_agent.get_next_path_position()
	
	var new_velocity: Vector2 = next_path_position - current_agent_position
	new_velocity = new_velocity.normalized()
	new_velocity = new_velocity * SPEED
	
	velocity = new_velocity
	if hp<=0:
		velocity = Vector2.ZERO
	if position.x - movement_target.position.x > 0:
		sprite2d.flip_h = true
	else:
		sprite2d.flip_h = false
	if (abs(velocity.x) > 10 or abs(velocity.y)>10) and hp>0:
		playback.travel("Walk")
	if navigation_agent.distance_to_target() <= 58 and hp>0:
		attack()
	if hp<=0 and not attacking:
		playback.travel("Death")
	if (playback.get_current_node() == "End"):
		queue_free()
		if attacking:
			movement_target.recibir_daño(damage)

		
	
	
		
	
	
	

	move_and_slide()
	

func actor_setup():
	await get_tree().physics_frame
	
	set_movement_target(movement_target.position)
	
func set_movement_target(target_point: Vector2):
	navigation_agent.target_position = target_point
	
func attack():
	playback.travel("Attack")
	attack_sound.play()
	hp = 0
	
	attacking = true
	
func take_damage(daño: int):
	hp -= daño
	
	


	

	



	
