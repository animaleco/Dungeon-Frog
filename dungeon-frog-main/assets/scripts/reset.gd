extends Button

@export var game_controller: GameController

func _ready():
	pressed.connect(_reset_progress)

func _reset_progress():
	GlobalController.level = 0
	GlobalController.deaths = 0
	game_controller.save_game()
	print("Progreso reseteado")
