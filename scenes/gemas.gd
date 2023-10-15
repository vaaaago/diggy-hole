extends Node2D



var timer: Timer


func _ready():
	
	timer = Timer.new()
	timer.one_shot = true
	timer.wait_time = 1
	add_child(timer)
	timer.timeout.connect(_on_timer_timeout)
	


func _input(event):
	if event.is_action_pressed("left_click"):
		timer.start()
	if event.is_action_released("left_click"):
		timer.stop()


func _on_timer_timeout():
	
