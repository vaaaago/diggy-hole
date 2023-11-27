extends Node2D


@export var rango: int
@export var movement_target: Node2D


var enemy0 = preload("res://scenes/Enemigos/flying_eye.tscn")
var enemy1 = preload("res://scenes/Enemigos/goblin.tscn")
var enemy2 = preload("res://scenes/Enemigos/Esqueleto.tscn")
var enemy3 = preload("res://scenes/Enemigos/Mushroom.tscn")



var enemy_list = [enemy0, enemy1, enemy2, enemy3]
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_SpawnTimer_timeout():
	var enemy_spawn = randi_range(0, rango-1)
	var scene = enemy_list[enemy_spawn].instantiate()
	scene.position = $SpawnLocation.position
	scene.movement_target = movement_target
	add_child(scene)
	
	
	
	
