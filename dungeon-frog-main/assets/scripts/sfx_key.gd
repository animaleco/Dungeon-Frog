extends AudioStreamPlayer2D

@export var sfx: Array[AudioStreamPlayer2D]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	finished.connect(_erase)


func _erase():
	queue_free()
