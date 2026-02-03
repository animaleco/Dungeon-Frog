class_name CoinsContainer
extends Node

var _total_coins: int
var _collected_coins: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var coins := get_children()
	_total_coins = coins.size()
	
	for coin in coins:
		coin.coins_container = self
	
	
func collect_coin():
	_collected_coins += 1
	
	if _collected_coins == _total_coins:
		get_parent().get_parent().next_level()
