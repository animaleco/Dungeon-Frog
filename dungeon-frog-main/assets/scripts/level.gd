class_name Level
extends Node2D

var key_container: KeysContainer
var player: Player

func _ready() -> void:
	key_container = $KeyContainer
	player = $Player
