extends Area2D  

@onready var animation_controller: AnimationController = $AnimationController
@onready var trigger: Trigger = $Trigger

func _ready():
	body_entered.connect(_on_body_entered)  
	trigger.trigger_activated.connect(animation_controller.play_animation)

func _on_body_entered(body: Node2D):
	if body is Player:
		body._on_area_2d_body_entered(body)
