class_name LevelManager
extends Node

signal level_loaded(level: Level)

@export var levels: Array[PackedScene]
@export var game_controller: GameController

var _recent_level: int = 0
var _instantiated_level: Node
	

func _create_level(number_level: int):
	_instantiated_level = levels[number_level].instantiate() 
	get_parent().add_child.call_deferred(_instantiated_level)
	_recent_level = number_level
	
	await  get_tree().process_frame
	
	if _instantiated_level is Level:
		level_loaded.emit(_instantiated_level)
		
		GlobalController.level = number_level
		game_controller.save_game()
		

func _remove_level():
	if _instantiated_level:
		_instantiated_level.queue_free()
		await _instantiated_level.tree_exited

func _reset_level():
	await _remove_level()
	_create_level(_recent_level)

func next_level():
	if _instantiated_level and _instantiated_level is Level:
		_instantiated_level.player._disable()
		
	_recent_level += 1
	var timer: Timer = Timer.new()
	add_child(timer)
	timer.start(0.4)
	await timer.timeout
	set_level(_recent_level)

func _load_level():
	_recent_level = GlobalController.level
	_create_level.call_deferred(_recent_level)

func set_level(level: int):
	await _remove_level()
	_create_level.call_deferred(level)
