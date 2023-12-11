extends Node

@export var main_menu: PackedScene
@export var credits: PackedScene
@export var gameover: PackedScene
@export var levels: Array[PackedScene]

var current_level = 0


func go_to_level(index):
	if index < levels.size():
		var level = levels[index]
		if level:
			get_tree().change_scene_to_packed(level)


func next_level():
	if current_level + 1 < levels.size():
		current_level += 1
		var level = levels[current_level]
		if level:
			get_tree().change_scene_to_packed(level)
			
func go_to_main_menu():
	if main_menu:
		get_tree().change_scene_to_packed(main_menu)
		current_level = 0


func go_to_credits():
	if credits:
		print("AAAAAAAAAAA")
		get_tree().change_scene_to_packed(credits)
		current_level = 0


func start_game():
	go_to_level(0)
	
func game_over():
	get_tree().change_scene_to_packed(gameover)
	
func reload_level():
	go_to_level(current_level)



