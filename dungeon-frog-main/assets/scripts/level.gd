class_name Level
extends Node2D

var coin_container: CoinsContainer
var player: Player

func _ready() -> void:
	coin_container = $CoinContainer
	player = $Player
