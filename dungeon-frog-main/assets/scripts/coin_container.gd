class_name CoinsContainer
extends Node

var _total_coins = 0
var _collected_coins: int = 0

signal all_coins_collected()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var coins := get_children()
	_total_coins = coins.size()
	for coin in coins:
		coin.collected.connect(collect_coin)
	
	
func collect_coin(_coin: Coin):
	_collected_coins += 1
	
	if _collected_coins == _total_coins:
		all_coins_collected.emit()
