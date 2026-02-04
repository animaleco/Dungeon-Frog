extends Node2D

@export var levels: Array[PackedScene]

var player: Player
var _recent_level: int = 0
var _instantiated_level: Node
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_create_level(_recent_level)
	
	
func _create_level(number_level: int):
	_instantiated_level = levels[number_level].instantiate() 
	print(_instantiated_level.name)
	add_child(_instantiated_level)
		
	if _instantiated_level is not Level:
		return 
	_instantiated_level.player.player_died.connect(_reset_level)
	_instantiated_level.coin_container.all_coins_collected.connect(next_level, CONNECT_ONE_SHOT)
	
func _remove_level():
	if _instantiated_level:
		_instantiated_level.queue_free()
		await _instantiated_level.tree_exited
	
	
func _reset_level():
	await _remove_level()
	_create_level.call_deferred(_recent_level)
	
	
func next_level():
	if _instantiated_level and _instantiated_level is Level:
		_instantiated_level.player._disable()
		
	_recent_level += 1
	var timer: Timer = Timer.new()
	add_child(timer)
	timer.start(0.4)
	await timer.timeout
	set_level(_recent_level)
	
	
func set_level(level: int):
	await _remove_level()
	_create_level.call_deferred(level)
