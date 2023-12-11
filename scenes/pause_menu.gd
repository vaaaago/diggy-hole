extends MarginContainer

@onready var button_resume = %Button_resume
@onready var button_retry = %Button_retry
@onready var button_menu = %Button_menu
@onready var button_exit = %Button_exit



func _ready() -> void:
	button_resume.pressed.connect(_on_resume_pressed)
	button_retry.pressed.connect(_on_retry_pressed)
	button_menu.pressed.connect(_on_menu_pressed)
	button_exit.pressed.connect(_on_exit_pressed)
	
	hide()

	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		visible = !visible
		get_tree().paused = visible
		

func _on_resume_pressed():
	hide()
	get_tree().paused = false


func _on_retry_pressed():
	get_tree().reload_current_scene()
	get_tree().paused = false

func _on_menu_pressed():

	get_tree().paused = false
	LevelManager.go_to_main_menu()

func _on_exit_pressed():
	get_tree().quit()
