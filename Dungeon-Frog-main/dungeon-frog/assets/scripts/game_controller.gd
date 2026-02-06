class_name GameController
extends Node

@export var game: SaveData	
var _path: String = "user://game.tres"

func _ready() -> void:
	_initialize_save()


func _initialize_save() -> void:
	if ResourceLoader.exists(_path):
		game = load(_path) as SaveData
		
	if not game:
		game = SaveData.new()

func save_game():
	game.level = GlobalController.level
	game.deaths = GlobalController.deaths
	
	ResourceSaver.save(game, _path)

func load_game():
	if ResourceLoader.exists(_path):
		game = load(_path) as SaveData
		
		GlobalController.level = game.level
		GlobalController.deaths = game.deaths
		ResourceSaver.save(game, _path)
