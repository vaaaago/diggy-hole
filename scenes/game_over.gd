extends Control

@onready var exit: Button = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/exit
@onready var try: Button = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/try






func _ready():
	try.pressed.connect(_on_button_try_pressed)
	exit.pressed.connect(_on_button_exit_pressed)
	
func _on_button_try_pressed():
	#reiniciar nivel
	pass
	
func _on_button_exit_pressed():
	get_tree().quit()
