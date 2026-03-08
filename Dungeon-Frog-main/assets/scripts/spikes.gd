extends Area2D  

@onready var animation_controller: AnimationController = $AnimationController
@onready var trigger: Trigger = $Trigger


func _ready():
	# Duplicar el shape para que no sea compartido
	$CollisionShape2D.shape = $CollisionShape2D.shape.duplicate()
	body_entered.connect(_on_body_entered)
	trigger.trigger_activated.connect(animation_controller.play_animation)
	$AnimationPlayer.animation_started.connect(func(anim): 
		print("ANIM: ", anim, " en ", name))
	

func _debug_animation(_body):
	print("ANIMACION DISPARADA en spike: ", name)

func _on_body_entered(body: Node2D):
	if body is Player:
		print("Muerte causada por: ", get_parent().name, " | tipo: ", get_parent().get_class())
		print("COLISION con: ", name, " en global_pos: ", global_position)
		body._on_area_2d_body_entered(body)
