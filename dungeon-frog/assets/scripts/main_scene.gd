extends Node2D

@export var levels: Array[PackedScene]

var _recent_level: int = 1
var _instantiated_level: Node
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_create_level(_recent_level)



func _create_level(number_level: int):
	_instantiated_level = levels[number_level - 1].instantiate()
	add_child(_instantiated_level)
	
	var children := _instantiated_level.get_children()
	for i in children.size():
		if children[i].is_in_group("players"):
			children[i].player_died.connect(_reset_level)
			break


func _remove_level():
	_instantiated_level.queue_free()
	
func _reset_level():
	print("a")
	_remove_level()
	print("aa")
	_create_level.call_deferred(_recent_level)
	print("aaa")
