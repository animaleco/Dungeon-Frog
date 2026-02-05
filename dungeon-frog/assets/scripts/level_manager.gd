extends Node2D
class_name Level

var coin_container: CoinsContainer
var player: Player

func _ready() -> void:
	coin_container = $CoinContainer
	player = $Player
