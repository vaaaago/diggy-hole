class_name TileCraft
extends TileMap



var mining = false
var max_timer = 0.5
var current_time = 0
var current_block 

func _process(delta):
	if mining:
		var coords = local_to_map(get_local_mouse_position())
		if coords != current_block:
			current_time = 0
			current_block = coords
		current_time += delta
		if current_time >= max_timer:
			current_time -= max_timer
			set_cell(1, current_block, -1)
 

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
