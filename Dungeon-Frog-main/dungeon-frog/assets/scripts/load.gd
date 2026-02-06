extends Button

@export var game_controller: GameController
@export var play_button: Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(_load)


func _load():
	game_controller.load_game()
	play_button.play()
