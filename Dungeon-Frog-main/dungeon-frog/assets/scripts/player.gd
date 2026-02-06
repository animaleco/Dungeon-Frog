class_name Player
extends CharacterBody2D

signal player_died

@export var animation: AnimatedSprite2D
@export var area_2d: Area2D
@export var _speed = 100.0
@export var _jump_velocity = -210.0

var coins_container: CoinsContainer
var _death: bool
var _can_move = true

func _ready():
	area_2d.body_entered.connect(_on_area_2d_body_entered)

func _physics_process(delta):
	if _death:
		return
		
	velocity += get_gravity() * delta
	
		# animation
	if  not is_on_floor():
		animation.play("idle")
	elif velocity.x != 0:
		animation.play("run")
	else:
		animation.play("idle")
	
	if not _can_move:
		return

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = _jump_velocity

	if Input.is_action_pressed("move_right"):
		velocity.x = _speed
		animation.flip_h = false
	elif Input.is_action_pressed("move_left"):
		velocity.x = -_speed
		animation.flip_h = true
	else:
		velocity.x = 0
	move_and_slide()
		

func _disable() -> void:
	_can_move = false
	velocity.x = 0

func _on_area_2d_body_entered(_body: Node2D) -> void:
	_death = true
	animation.play("death")
	await get_tree().create_timer(0.3).timeout
	# await get_tree().create_timer(0.5).timeout <-- forma abreviada
	await get_tree().create_timer(0.5).timeout
	player_died.emit()
	GlobalController.add_death()
	
	
