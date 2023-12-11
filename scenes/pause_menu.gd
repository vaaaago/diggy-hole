extends CanvasLayer


@onready var resume = %Button_resume
@onready var retry = %Button_retry
@onready var menu = %Button_menu
@onready var exit = %Button_exit


func _ready() -> void:
	resume.pressed.connect(_on_resume_pressed)
	retry.pressed.connect(_on_retry_pressed)
	menu.pressed.connect(_on_menu_pressed)
	exit.pressed.connect(_on_exit_pressed)
	
	
	hide()

	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		visible = !visible
		get_tree().paused = visible
		

func _on_resume_pressed():
	hide()
	get_tree().paused = false


func _on_retry_pressed():
	get_tree().paused = false
	LevelManager.reload_level()

func _on_menu_pressed():

	get_tree().paused = false
	LevelManager.go_to_main_menu()

func _on_exit_pressed():
	get_tree().quit()
