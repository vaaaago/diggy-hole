extends Node2D

const section_time = 2.0
const line_time = 0.3
const base_speed = 100
const speed_up_multiplier = 10.0
const title_color = Color.BLUE_VIOLET

var scroll_speed = base_speed
var speed_up = false

@onready var line = $CreditsContainer/Line
var started = false
var finished = false

var section
var section_next = true
var section_timer = 0.0
var line_timer = 0.0
var curr_line = 0
var lines = []

var credits = [
	[
		"Juego hecho por LevelUpLabs"
	],[
		"Enano",
		"",
		"Javier Venegas M."
	],[
		"Mapa",
		"",
		"Catalina Muñoz O."
	],[
		"Enemigos",
		"",
		"Raul Aliste B."
	],[
		"Sound Effects",
		"",
		"SFX Name"
	],[
		"Muchas gracias al equipo docente",
		"",
		"Elías Zelada",
		"",
		"Christopher Marín R.",
		"",
		"Diego García E.",
		"",
		"Nadia Decar D. (Especiales gracias por toda la ayuda en discord y telegram)"
	],[
		"Herramientas y assets usados",
		"",
		"Desarrollado en Godot Engine",
		"https://godotengine.org/license",
		"",
		"2D Pixel Art Dwarf Miner Sprites",
		"https://elthen.itch.io/2d-pixel-art-dwarf-miner",
		"",
		"Mork Dungeon A Free Medieval Font",
		"https://markgosbell.itch.io/mork-dungeon",
		"",
		"Monsters Creatures Fantasy",
		"https://luizmelo.itch.io/monsters-creatures-fantasy",
		"",
		"Textures",
		"https://piiixl.itch.io/textures",
		"",
		"Animated Traps",
		"https://stealthix.itch.io/animated-traps",
		"",
		"16x16 Simple Pixel Art Weapons",
		"https://powered-by-decaf.itch.io/simple-pixel-art-weapons-16x16",
		"",
		"Minifantasy SFX Bundle",
		"https://leohpaz.itch.io/minifantasy-dungeon-sfx-pack"
	]
]


func _process(delta):
	var scroll_speed = base_speed * delta
	
	if section_next:
		section_timer += delta * speed_up_multiplier if speed_up else delta
		if section_timer >= section_time:
			section_timer -= section_time
			
			if credits.size() > 0:
				started = true
				section = credits.pop_front()
				curr_line = 0
				add_line()
	
	else:
		line_timer += delta * speed_up_multiplier if speed_up else delta
		if line_timer >= line_time:
			line_timer -= line_time
			add_line()
	
	if speed_up:
		scroll_speed *= speed_up_multiplier
	
	if lines.size() > 0:
		for l in lines:
			l.position.y -= scroll_speed
			if l.position.y < -l.get_line_height():
				lines.erase(l)
				l.queue_free()
	elif started:
		finish()


func finish():
	if not finished:
		finished = true
		get_tree().change_scene_to_file("res://scenes/menu-inicio.tscn")


func add_line():
	var new_line = line.duplicate()
	new_line.text = section.pop_front()
	lines.append(new_line)
	if curr_line == 0:
		new_line.set("theme_override_colors/font_color", title_color)
	new_line.set("VerticalAlignment", 1)
	$CreditsContainer.add_child(new_line)
	
	if section.size() > 0:
		curr_line += 1
		section_next = false
	else:
		section_next = true


func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		finish()
	if event.is_action_pressed("ui_down") and !event.is_echo():
		speed_up = true
	if event.is_action_released("ui_down") and !event.is_echo():
		speed_up = false
