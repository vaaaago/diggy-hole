extends StaticBody2D

@onready var area_2d = $"../StaticBody2D7/Area2D"


var timer: Timer
var entro_mouse = false


func _ready():
	
	timer = Timer.new()
	timer.one_shot = true
	timer.wait_time = 1
	add_child(timer)
	timer.timeout.connect(_on_timer_timeout)
	area_2d.connect("mouse_entered",_on_area_2d_mouse_entered)
	area_2d.connect("mouse_exited",_on_area_2d_mouse_exited)

func _input(event):
	if event.is_action_pressed("left_click") and entro_mouse:
		timer.start()
	

func _on_timer_timeout():
	self.queue_free()


func _on_area_2d_mouse_entered():
	entro_mouse = true
	

func _on_area_2d_mouse_exited():
	entro_mouse = false


func _on_mouse_entered():
	pass # Replace with function body.


func _on_mouse_exited():
	pass # Replace with function body.
