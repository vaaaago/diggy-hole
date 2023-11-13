extends CharacterBody2D
@onready var boltspawn = $pivote/boltspawn
@export var bolt_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if Input.is_action_just_pressed("disparar"):
		print("disparo")
		disparar()
# Called every frame. 'delt@onready var boltspawn = $pivote/boltspawn
func disparar():
	var bolt = bolt_scene.instantiate()
	get_parent().add_child(bolt)
	bolt.global_position = boltspawn.global_position
	bolt.rotation = boltspawn.global_position.direction_to(get_global_mouse_position()).angle() #angulo que apunta al mouse
	
