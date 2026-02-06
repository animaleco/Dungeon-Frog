extends Control

@export var label: Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalController.deaths_update.connect(_update_text)
	_update_text()


func _update_text():
	label.text =  str(GlobalController.deaths)
