#class_name TileCraft
extends TileMap



var mining = false
var max_timer = 0.5
var current_time = 0
var current_block 
var rango_cavar = 70
@onready var enano: CharacterBody2D = $"../enano"

func _process(delta):
	var posicion_enano = enano.global_position
	var posicion_mouse = get_global_mouse_position()
	
	if mining and posicion_enano.distance_to(posicion_mouse) <= rango_cavar:
		var coords = local_to_map(get_local_mouse_position())
		if coords != current_block:
			current_time = 0
			current_block = coords
		current_time += delta
		if current_time >= max_timer:
			current_time -= max_timer
			set_cell(1, current_block, -1)
			set_cell(0, current_block, 0, Vector2i(5, 30))
 

func _input(event):
	if event.is_action_pressed("left_click"):
		mining = true
		current_block = local_to_map(get_local_mouse_position())
		
	if event.is_action_released("left_click"):
		mining = false





func _on_area_2d_mouse_entered():
	pass # Replace with function body.


func _on_static_body_2d_7_mouse_entered():
	pass # Replace with function body.
