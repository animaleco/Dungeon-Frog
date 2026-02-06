class_name Coin
extends Node2D

@export var area_2d: Area2D
@export var reproductor: AudioStreamPlayer2D

signal collected(coin: Coin)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area_2d.body_entered.connect(_recollect)
	_start_animation()
	

func _recollect(_body):
	reproductor.reparent(get_parent())
	reproductor.play()
	collected.emit(self)
	queue_free()

func _start_animation():
	var tween: Tween = create_tween()
	tween.set_loops(0)
	tween.tween_property(self, "position:y", position.y -1, 0.8).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, "position:y", position.y +1, 0.8).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
