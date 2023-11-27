extends CharacterBody2D

var speed = 400  # Velocidad de movimiento en píxeles por segundo
var hp = 10

func _physics_process(delta):
	var motion = Vector2()

	if Input.is_action_pressed("move_up"):
		motion.y -= 1

	if Input.is_action_pressed("move_down"):
		motion.y += 1

	if Input.is_action_pressed("move_left"):
		motion.x -= 1

	if Input.is_action_pressed("move_right"):
		motion.x += 1


	motion = motion.normalized() * speed
	velocity = motion
	print(hp)
	move_and_slide()
