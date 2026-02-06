extends RigidBody2D

var trigger: Trigger

func _ready() -> void:
	trigger = $Trigger
	trigger.trigger_activated.connect(_on_trigger_activated)
	freeze = true
	
func _on_trigger_activated(_body: Node2D) -> void:
	set_deferred("freeze", false)
