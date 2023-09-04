extends CharacterBody2D


const SPEED = 400.0
var acceleration = 1000

@export var movement_target: Node2D
@export var navigation_agent: NavigationAgent2D



@onready var animation_player = $AnimationPlayer
@onready var animation_tree = $AnimationTree

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	animation_tree.active = true
	navigation_agent.path_desired_distance = 4.0
	navigation_agent.target_desired_distance = 4.0
	
	call_deferred("actor_setup")

func _physics_process(delta):
	if navigation_agent.is_navigation_finished():
		return
	set_movement_target(movement_target.position)
	var current_agent_position: Vector2 = global_position
	var next_path_position: Vector2 = navigation_agent.get_next_path_position()
	
	var new_velocity: Vector2 = next_path_position - current_agent_position
	new_velocity = new_velocity.normalized()
	new_velocity = new_velocity * SPEED
	
	velocity = new_velocity
	

	move_and_slide()

func actor_setup():
	await get_tree().physics_frame
	
	set_movement_target(movement_target.position)
	
func set_movement_target(target_point: Vector2):
	navigation_agent.target_position = target_point
