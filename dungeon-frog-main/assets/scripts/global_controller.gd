extends Node

signal deaths_update

var level: int = 0
var deaths: int = 0

func add_death():
	deaths += 1
	deaths_update.emit()
