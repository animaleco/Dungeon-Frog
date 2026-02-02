extends CharacterBody2D

signal player_died

@export var animation: AnimatedSprite2D
@export var area_2d: Area2D
@export var _speed = 100.0
@export var _jump_velocity = -210.0


var _death: bool


func _ready():
	add_to_group("players")
	area_2d.body_entered.connect(_on_area_2d_body_entered)

func _physics_process(delta):
	if _death:
		return
	
		
	velocity += get_gravity() * delta

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
		
	# animation
	if !is_on_floor():
		animation.play("front idle")
	elif velocity.x != 0:
		animation.play("right run")
	else:
		animation.play("right idle")


func _on_area_2d_body_entered(_body: Node2D) -> void:
	print("muerto")
	_death = true
	animation.stop()
	print("stop")
	player_died.emit()
	print("emit")
