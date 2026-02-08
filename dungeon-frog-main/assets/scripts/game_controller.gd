class_name GameController
extends Node

@export var game: SaveData	
var _path: String = "user://game.tres"

func _ready() -> void:
	load_game()  # Simplemente llama a load_game directamente

func load_game():
	if ResourceLoader.exists(_path):
		game = load(_path) as SaveData
	
	if not game:
		game = SaveData.new()
	
	# Transferir datos al GlobalController
	GlobalController.level = game.level
	GlobalController.deaths = game.deaths

func save_game():
	game.level = GlobalController.level
	game.deaths = GlobalController.deaths
	
	ResourceSaver.save(game, _path)
		
