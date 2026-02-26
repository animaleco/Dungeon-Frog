class_name KeysContainer
extends Node

var _total_keys = 0
var _collected_keys: int = 0

signal all_keys_collected()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var keys := get_children()
	_total_keys = keys.size()
	for key in keys:
		key.collected.connect(collect_key)
	
	
func collect_key(_key: Key):
	_collected_keys += 1	
	if _collected_keys == _total_keys:
		all_keys_collected.emit()
