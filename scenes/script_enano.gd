extends CharacterBody2D

var speed = 200  # Velocidad de movimiento en píxeles por segundo

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
	move_and_slide()
