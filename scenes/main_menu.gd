extends MarginContainer

@onready var button_play: Button = %Button_play
@onready var button_exit: Button = %Button_exit
@onready var button_credits: Button = %Button_credits

func _ready():
	button_play.pressed.connect(_on_button_play_pressed)
	button_exit.pressed.connect(_on_button_exit_pressed)
	button_credits.pressed.connect(_on_button_credits_pressed)
	
func _on_button_play_pressed():
	LevelManager.start_game()
	
func _on_button_exit_pressed():
	get_tree().quit()
	
func _on_button_credits_pressed():
	LevelManager.go_to_credits()
