extends Control

@onready var button = $PanelContainer/MarginContainer/Button



func _ready():
	button.pressed.connect(_on_button_pressed)
	
func _on_button_pressed():
	LevelManager.next_level()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
