extends Node

class_name AnimationController

@export var animation_player: AnimationPlayer
@export var animation_name: String = "move"
@export var auto_find_animation_player: bool = true
@export var trigger: Trigger

func _ready():
	# Intentar encontrar el AnimationPlayer automáticamente
	if auto_find_animation_player and not animation_player:
		# Buscar en el padre
		animation_player = get_parent().get_node_or_null("AnimationPlayer")
		
		# Si no está en el padre, buscar en hermanos
		if not animation_player:
			for sibling in get_parent().get_children():
				if sibling is AnimationPlayer:
					animation_player = sibling
					break
	
	if not animation_player:
		push_warning("AnimationController: No se encontró AnimationPlayer en " + get_parent().name)
		
	if not trigger:
		trigger = get_parent().get_node_or_null("Trigger")
		
	if trigger:
		trigger.trigger_activated.connect(play_animation)

func play_animation(_body: Node2D = null) -> void:
	if animation_player and animation_player.has_animation(animation_name):
		animation_player.play(animation_name)
	else:
		push_warning("No se puede reproducir la animación: " + animation_name)

func stop_animation(_body: Node2D = null) -> void:
	if animation_player:
		animation_player.stop()
