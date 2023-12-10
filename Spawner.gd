extends Node2D


@export var rango: int
@export var movement_target: Node2D
@export var tilemap: TileMap



var enemy0 = preload("res://scenes/Enemigos/flying_eye.tscn")
var enemy1 = preload("res://scenes/Enemigos/goblin.tscn")
var enemy2 = preload("res://scenes/Enemigos/Esqueleto.tscn")
var enemy3 = preload("res://scenes/Enemigos/Mushroom.tscn")
@onready var navigationMap = tilemap.get_layer_navigation_map(0)
@onready var timer = $SpawnTimer
@onready var time = timer.wait_time
@onready var readyToSpawn = false
@onready var timeCicles = 0



var enemy_list = [enemy0, enemy1, enemy2, enemy3]
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	navigationMap = tilemap.get_layer_navigation_map(0)
	var children = get_children()
	var cnt = children.size()-2
	if cnt > 10:
		timer.set_paused(true)
	else:
		if timer.is_paused():
			timer.set_paused(false)


func _on_SpawnTimer_timeout():
	if (timeCicles*time < 30):
		timeCicles += 1
	else:
		var enemy_spawn = randi_range(0, rango-1)
		var scene = enemy_list[enemy_spawn].instantiate()
		scene.position = $SpawnLocation.position
		scene.movement_target = movement_target
		var enemyNavAgent = scene.navigation_agent
		enemyNavAgent.set_navigation_map(navigationMap)
		add_child(scene)
	
	
	
	
