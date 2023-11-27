extends MarginContainer

@onready var button_play: Button = %Button_play
@onready var button_exit: Button = %Button_exit

func _ready():
	button_play.pressed.connect(_on_button_play_pressed)
	button_exit.pressed.connect(_on_button_exit_pressed)
	
func _on_button_play_pressed():
	LevelManager.start_game()
	
func _on_button_exit_pressed():
	get_tree().quit()
