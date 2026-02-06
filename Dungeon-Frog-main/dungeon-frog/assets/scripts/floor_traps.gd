extends Node2D

var animation_controller: AnimationController
var trigger: Trigger


func _ready() -> void:
	animation_controller = $AnimationController
	trigger = $Trigger
	
	trigger.trigger_activated.connect(animation_controller.play_animation)
	
