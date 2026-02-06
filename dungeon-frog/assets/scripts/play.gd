extends Button

@export var main_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(play, 4) # <- 4 = ConnectFlags.CONNECT_ONE_SHOT


func play():
	get_tree().change_scene_to_packed(main_scene)
