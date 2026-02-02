extends Area2D

class_name Trigger

# Señales para que otros nodos respondan
signal trigger_activated(body: Node2D)
signal trigger_deactivated(body: Node2D)

# Propiedades configurables desde el editor
@export var trigger_name: String = "trigger"
@export var one_shot: bool = false  # Si solo se activa una vez
@export var target_group: String = "player"  # Qué grupo debe activarlo

var _has_been_triggered: bool = false

func _ready():
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _on_body_entered(body: Node2D) -> void:
	# Verificar si el cuerpo está en el grupo objetivo
	if not body.is_in_group(target_group):
		return
	
	# Si es one_shot y ya se activó, ignorar
	if one_shot and _has_been_triggered:
		return
	
	_has_been_triggered = true
	trigger_activated.emit(body)

func _on_body_exited(body: Node2D) -> void:
	if not body.is_in_group(target_group):
		return
	
	trigger_deactivated.emit(body)
